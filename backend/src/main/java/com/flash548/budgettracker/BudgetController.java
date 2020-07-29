package com.flash548.budgettracker;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

@CrossOrigin(origins = "http://localhost:8080")
@RestController
public class BudgetController {

    private CategoryRespository categoryRespository;
    private TransactionRespository transactionRespository;
    private SettingsRespository settingsRespository;
    private RangeRepository rangeRepository;

    public BudgetController(CategoryRespository cr,
                            TransactionRespository tr,
                            SettingsRespository sr,
                            RangeRepository rr) {

        this.categoryRespository = cr;
        this.transactionRespository = tr;
        this.settingsRespository = sr;
        this.rangeRepository = rr;
    }

    // private helper to get a hashmap of the Categories Strings vs Ids
    private Map<Long, String> getCatHash() {
        Iterable<Category> cats = this.categoryRespository.findAll();
        Map<Long, String> catsIds = new HashMap<>();
        for (Category c : cats) catsIds.put(c.getId(), c.getCategory());
        return catsIds;
    }

    @GetMapping("/categories")
    public Iterable<Category> getCategories() {
        return this.categoryRespository.findAll();
    }

    @GetMapping("/income")
    public Settings getIncome(HttpServletResponse resp) {
        try {
            if(this.settingsRespository.findById(1L).isPresent()) {
                return this.settingsRespository.findById(1L).get();
            }
            else {
                resp.setStatus(500);
                return null;
            }
        }
        catch (Exception e) {
            resp.setStatus(500);
            return null;
        }
    }

    @GetMapping("/ranges")
    public ResolvedRange[] getRanges() {
        Map<Long, String> catsIds = this.getCatHash();

        List<ResolvedRange> resRanges = new ArrayList<>();
        for (Range r : this.rangeRepository.findAll()) {
            ResolvedRange newRange = new ResolvedRange();
            newRange.setId(r.getId());
            newRange.setCategory(catsIds.get(Long.valueOf(r.getCategory())));
            newRange.setLow(r.getLow());
            newRange.setHigh(r.getHigh());
            resRanges.add(newRange);
        }

        return resRanges.toArray(new ResolvedRange[resRanges.size()]);
    }

    @PostMapping("/transactions")
    public ResolvedTransaction[] requestTransactions(@RequestBody TransactionRequest params) {

        List<String> catStrings = new ArrayList<>();
        Iterable<Category> cats = this.categoryRespository.findAll();
        Map<Long, String> catsIds = this.getCatHash();

        if (params.getCategories() == null) {
            // if categories param was null, then get all categories for the query
            for (Category c : cats) catStrings.add(c.getCategory());
        }
        else {
            // categories wasn't null, so supply the given strings
            for (String c : params.getCategories()) catStrings.add(c);
        }

        Transaction[] trans = this.transactionRespository.searchTransactions(catStrings, params.getFromAmount(), params.getToAmount(),
                params.getFromDate(), params.getToDate());

        // TODO: make the custom query do this work for us... this is kludgey
        // Convert to resolved transactions where ID = plain-english word for category
        ResolvedTransaction[] resTrans = new ResolvedTransaction[trans.length];
        for (int i=0;i<trans.length;i++) {
            ResolvedTransaction r = new ResolvedTransaction();
            r.setId(trans[i].getId());
            r.setCategory(catsIds.get(Long.valueOf(trans[i].getCategory())));
            r.setDate(trans[i].getDate());
            r.setAmount(trans[i].getAmount());
            r.setRemarks(trans[i].getRemarks());
            resTrans[i] = r;
        }
        return resTrans;
    }

    @PatchMapping("/transactions/add")
    public Transaction addNewTransaction(@RequestBody ResolvedTransaction newTrans, HttpServletResponse resp) {

        Transaction t = new Transaction();
        t.setDate(newTrans.getDate());
        t.setAmount(newTrans.getAmount());
        t.setRemarks(newTrans.getRemarks());
        // now resolved category name to its ID
        Map<Long, String> catsIds = this.getCatHash();

        // make sure category even existed first, otherwise fail out now
        if (!catsIds.values().contains(newTrans.getCategory())) {
           resp.setStatus(500);
           return null;
        }

        // TODO: refactor this into a function
        Long catId = -1L;
        for (Long id : catsIds.keySet()) {
            if (catsIds.get(id).equals(newTrans.getCategory())) {
                catId = id;
                break;
            }
        }

        // if somehow didn't find the category ID, then fail out now.
        if (catId == -1L) {
            resp.setStatus(500);
            return null;
        }

        // TODO: need to fix this
        t.setCategory(catId.intValue());

        try {
            return this.transactionRespository.save(t);
        }
        catch (Exception e) {
            resp.setStatus(500);
            return null;
        }

    }

    @PatchMapping("/transactions/update")
    public Transaction updateTransaction(@RequestBody ResolvedTransaction newTrans, HttpServletResponse resp) {

        Transaction t = new Transaction();
        t.setId(newTrans.getId());
        System.out.println(t.getId());
        t.setDate(newTrans.getDate());
        System.out.println(t.getDate());
        t.setAmount(newTrans.getAmount());
        System.out.println(t.getAmount());
        t.setRemarks(newTrans.getRemarks());
        System.out.println(t.getRemarks());
        // now resolved category name to its ID
        Map<Long, String> catsIds = this.getCatHash();

        // make sure category even existed first, otherwise fail out now
        if (!catsIds.values().contains(newTrans.getCategory())) {
            resp.setStatus(500);
            return null;
        }

        // TODO: refactor this into a function
        Long catId = -1L;
        for (Long id : catsIds.keySet()) {
            if (catsIds.get(id).equals(newTrans.getCategory())) {
                catId = id;
                break;
            }
        }

        // if somehow didn't find the category ID, then fail out now.
        if (catId == -1L) {
            resp.setStatus(500);
            return null;
        }

        // TODO: need to fix this
        t.setCategory(catId.intValue());

        try {
            return this.transactionRespository.save(t);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            resp.setStatus(500);
            return null;
        }

    }

    @PatchMapping("/categories/add/{name}")
    public Iterable<Category> addCategory(@PathVariable String name, HttpServletResponse resp) {
        Category newCategory = new Category();
        newCategory.setCategory(name);

        Map<Long, String> catsIds = this.getCatHash();

        // make sure category doesn't exist first
        if (catsIds.values().contains(name)) { resp.setStatus(500); return null; }

        try {
            this.categoryRespository.save(newCategory);

            // return new list of categories
            return this.categoryRespository.findAll();
        }
        catch (Exception e) {
            resp.setStatus(500);
            return null;
        }
    }

    @PatchMapping("/ranges/{category}/{lowPercent}/{highPercent}")
    public ResolvedRange[] addUpdateRange(@PathVariable String category, @PathVariable Float lowPercent,
                                          @PathVariable Float highPercent, HttpServletResponse resp) {

        Map<Long, String> catsIds = this.getCatHash();

        // see if category exists first
        if (!catsIds.values().contains(category)) { resp.setStatus(500); return null; }
        System.out.println(lowPercent + "   " + highPercent + "  "  + category);
        this.rangeRepository.updateRange(lowPercent, highPercent, category);
        return this.getRanges();
    }

    @DeleteMapping("/categories/remove/{name}")
    public Iterable<Category> removeCategory(@PathVariable String name, HttpServletResponse resp) {
        Map<Long, String> catsIds = this.getCatHash();

        // make sure category exists
        if (!catsIds.values().contains(name)) { resp.setStatus(500); return null; }

        // disallow removal of the Income special category
        if (name.equals("Income")) { resp.setStatus(500); return null;}

        try {
            Long id = -1L;
            for (Long i : catsIds.keySet()) {
                if (catsIds.get(i).equals(name)) {
                    id = i;
                    break;
                }
            }
            this.categoryRespository.deleteById(id);

            // return new list of categories
            return this.categoryRespository.findAll();
        }
        catch (Exception e) {
            resp.setStatus(500);
            return null;
        }
    }

    @DeleteMapping("/transactions/remove/{id}")
    public Transaction removeById(@PathVariable Long id, HttpServletResponse resp) {
        try {
            Optional<Transaction> t = this.transactionRespository.findById(id);
            if (t.isPresent()) {
                this.transactionRespository.deleteById(id);
                return t.get();
            }
            else {
                resp.setStatus(500);
                return null;
            }

        }
        catch (Exception e) {
            resp.setStatus(500);
            return null;
        }
    }


}
