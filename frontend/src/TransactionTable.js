import Container from '@material-ui/core/Container';
import IconButton from '@material-ui/core/IconButton';
import Paper from '@material-ui/core/Paper';
import Snackbar from '@material-ui/core/Snackbar';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import DeleteIcon from '@material-ui/icons/Delete';
import EditIcon from '@material-ui/icons/Edit';
import MuiAlert from '@material-ui/lab/Alert';
import { format } from 'date-fns';
import React from 'react';
import './App.css';
import EditTransaction from './EditTransaction';
import Options from './Options';
import Stats from './Stats.js';
import TopBar from './TopBar.js';

// custom control taken from Material UI website example...
function Alert(props) {
    return <MuiAlert elevation={6} variant="filled" {...props} />;
}

class TransactionTable extends React.Component {

    constructor(props) {
        super(props);
        this.host = props.host || "http://localhost:8080";
        this.initial = true;
        this.state = {
            categories: [],
            activeCategories: [],
            fromAmount: null,  // null is max lower bound
            toAmount: null,    // null is max upper bound
            fromDate: format(new Date(), 'yyyy-MM-01'),
            toDate: format(new Date(), 'yyyy-MM-dd'),
            currentData: [],
            successToast: false,
            failureToast: false,
            openEditDlg: false,
            currentRecord: {},
        };
    }

    componentDidMount() {
        // do initial data pull...
        this.doDataPull();
    }

    // refresh all data according to current query parameters...
    doDataPull = async () => {

        // pull down the category names...
        let categoriesResp = await fetch(`${this.host}/categories`);
        let categoriesData = await categoriesResp.json();
        categoriesData = categoriesData.map(x=> x.category);

        // pull down the category ranges...
        let rangesResp = await fetch(`${this.host}/ranges`);
        let rangesData = await rangesResp.json();

        // pull down the transaction data...
        let resp = await fetch(`${this.host}/transactions`,
            {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    categories: (this.initial) ? categoriesData : this.state.activeCategories,
                    fromAmount: this.state.fromAmount,
                    toAmount: this.state.toAmount,
                    fromDate: this.state.fromDate,
                    toDate: this.state.toDate,
                })                
            });

        // make sure we got a 200 reponse, otherwise populate with no data...
        if (resp.status === 200) {
            let data = await resp.json();

            // go thru for each category and get sums of each category
            let totals = {};
            let percentages = {};
            for (let cat of categoriesData) {
                let cats = data.filter(x => x.category === cat);
                if (cats.length > 0) {
                    let total = cats.map(x => x.amount).reduce((a,b) => a + b);
                    totals[cat] = Math.round((total + Number.EPSILON) * 100) / 100;
                }
                else {
                    totals[cat] = 0.00;                    
                }
            }

            if (!Object.keys(totals).includes("Income")) {
                // somehow the totals object didn't have Income
                // so make it like 0.01 to avoid a later divide by zero error
                totals["Income"] = 0.01;
            }

            for (let cat in totals) {
                if (cat === "Income") continue;
                let percentage = ((totals[cat] / totals["Income"])*100).toFixed(2);
                percentages[cat] = percentage;
            }

            this.setState( { activeCategories: (this.initial) ? categoriesData : this.state.activeCategories,
                 categories: categoriesData, currentData: data, ranges: rangesData, totals: totals, percentages: percentages });
        }
        else {
            this.setState( { activeCategories: (this.initial) ? categoriesData : this.state.activeCategories,
                     categories: categoriesData, currentData: null, ranges: rangesData, totals: null, percentages: null });
        }

        // this is not the initial data pull anymore..
        this.initial = false;
    }

    // db CRUD functions...
    submitTransaction = async (trans) => {
        let resp = await fetch(`${this.host}/transactions/add`,
        {
            method: 'PATCH',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(trans),                
        });

        if (resp.status === 200) {
            await resp.json();
            await this.doDataPull();
            return true;
        }
        else {
            return false; 
        } 
    }
    submitUpdateTransaction = async () => {
        let resp = await fetch(`${this.host}/transactions/update`,
        {
            method: 'PATCH',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(this.state.currentRecord),                
        });

        if (resp.status === 200) {
            await resp.json();
            await this.doDataPull();
            this.openSuccessToast("Record Updated!");
        }
        else {
            return this.openFailureToast("Failed to Update Entry!");
        } 
    }
    deleteTrans = async (event) => {
        if (window.confirm("Are you sure you want to delete this transaction?")) {
            let resp = await fetch(`${this.host}/transactions/remove/` + event.currentTarget.id,
            {
                    method: 'DELETE',
            });

            if (resp.status === 200) {
                await resp.json();
                await this.doDataPull();
                this.openSuccessToast("Entry Deleted");
            }
            else {
                this.openFailureToast("Failed to Delete Entry!");
            }  
        }
    }
    editTrans =  (event) => {
        let currentRecord = {};
        for (let rec of this.state.currentData) {
            if (rec.id == event.currentTarget.id) {
                currentRecord = {...rec};
                this.setState({currentRecord: currentRecord, openEditDlg: true});
                return;
            }
        }

        this.setState({openEditDlg: false});
        
    }
    deleteCategory = async (cat) => {
        if (window.confirm("Are you sure you want to delete this category and all its transactions!?")) {
            let resp = await fetch(`${this.host}/categories/remove/` + cat,
            {
                    method: 'DELETE',
            });

            if (resp.status === 200) {
                await resp.json();
                await this.doDataPull();
                this.openSuccessToast("Category Deleted");
            }
            else {
                this.openFailureToast("Failed to Delete Category!");
            }  
        }
    }
    editCategoryNameRange = async (data) => {

        // first see if we have a name change
        if (data.oldName !== data.newName) {
            // do the name change first
            // but make sure new name isn't "Income" reserved group
            if (data.newName == "Income") {
                this.openFailureToast("Can't use 'Income' for a new category name!");
                return;
            }

            let resp = await fetch(`${this.host}/categories/rename/` + data.oldName + "/" + data.newName,
                {
                    method: 'PATCH',
                });

            if (resp.status != 200) {
                this.openFailureToast("Failed to Rename Category!");
                return;
            }
        }


        // validate the numbers
        if (isNaN(data.newLow) || isNaN(data.newHigh)) {
            this.openFailureToast("Invalid range numbers!");
            return;
        }
        if (data.newLow >= data.newHigh) {
            this.openFailureToast("Invalid low/high numerical range!");
            return;
        }

        let resp = await fetch(`${this.host}/ranges/update/` + data.newName + "/" + data.newLow + "/" + data.newHigh,
            {
                method: 'PATCH',
            });

        if (resp.status != 200) {
            this.openFailureToast("Failed to Change Category Limits!");
        }
        else {
            await this.doDataPull();
            this.openSuccessToast("Change Success!");
        }

    }
    addNewCategoryAndRange = async (data) => {
        // do the name change first
        // but make sure new name isn't "Income" reserved group
        if (data.newName == "Income") {
            this.openFailureToast("Can't use 'Income' for a new category name!");
            return;
        }

        let resp = await fetch(`${this.host}/categories/add/` + data.newName,
            {
                method: 'PATCH',
            });

        if (resp.status != 200) {
            this.openFailureToast("Failed to Add New Category!");
            return;
        }

        // validate the numbers
        if (isNaN(data.newLow) || isNaN(data.newHigh)) {
            this.openFailureToast("Invalid range numbers!");
            return;
        }
        if (data.newLow >= data.newHigh) {
            this.openFailureToast("Invalid low/high numerical range!");
            return;
        }
        console.log(data);
        resp = await fetch(`${this.host}/ranges/add/` + data.newName + "/" + data.newLow + "/" + data.newHigh,
            {
                method: 'PATCH',
            });

        if (resp.status != 200) {
            this.openFailureToast("Failed to add New Category Limits!");
        }
        else {
            await this.doDataPull();
            this.openSuccessToast("Add New Category Success!");
        }
    }

    // functions for the Edit Transaction dialog
    updateCurrentRecordCategory = (category) => { this.setState({currentRecord: {...this.state.currentRecord, category: category }})}
    updateCurrentRecordDate = (date) => { this.setState({currentRecord: {...this.state.currentRecord, date: date }})}
    updateCurrentRecordAmount = (amount) => { this.setState({currentRecord: {...this.state.currentRecord, amount: amount }})}
    updateCurrentRecordRemarks = (remarks) => { this.setState({currentRecord: {...this.state.currentRecord, remarks: remarks }})}
    closeEditDlg = () => {
        this.setState({openEditDlg: false, currentRecord: {}});
    }


    // functions for the search/filter parameters
    changeFromDate = (event) => { this.setState( { fromDate: event.target.value } ) }
    changeToDate = (event) => { this.setState( { toDate: event.target.value } ) }
    toggleCat = (name) => {
        if (this.state.activeCategories.includes(name) ) {
            let cats = [...this.state.activeCategories];
            cats.splice(cats.indexOf(name), 1);
            this.setState({activeCategories: [...cats]});
        }
        else {
            this.setState({activeCategories: [...this.state.activeCategories, name]});
        }
    }
    toggleAllCats = (selectAll) => { 
        if (selectAll) this.setState({activeCategories: [...this.state.categories]}); 
        else this.setState({activeCategories: []}); 
    }
    changeFromAmount = (amnt) => { 
        this.setState({fromAmount: (amnt)});
    };
    changeToAmount = (amnt) => {
        this.setState({toAmount: (amnt)} ); 
    }

    // action to refresh/restore data...
    refresh = () => { this.doDataPull(); }
    reset = () => {
       this.setState({ fromDate: format(new Date(), 'yyyy-MM-01'),
                        toDate: format(new Date(), 'yyyy-MM-dd'),
                        fromAmount: null,
                        toAmount: null});
       this.initial = true;
       this.doDataPull();
    }

    // some general purpose toast actions...
    openSuccessToast = (msg) => {
        this.setState({ message: msg, successToast: true});
    } 
    closeSuccessToast = () => {
        this.setState({ successToast: false});
    } 
    openFailureToast = (msg) => {
        this.setState({ message: msg, failureToast: true});
    }
    closeFailureToast = () => {
        this.setState({ failureToast: false});
    }

    render() {
        return (
            <Container maxWidth="sm">
                <TopBar parent={this}/>
                <Options parent={this}/>
                <Stats parent={this}/>
                <TableContainer component={Paper}>
                <Table padding="none" size="small">
                    <TableHead>
                    <TableRow>
                        <TableCell>Category</TableCell>
                        <TableCell>Date</TableCell>
                        <TableCell>Amount</TableCell>
                        <TableCell>Remarks</TableCell>
                        <TableCell></TableCell>
                        <TableCell></TableCell>
                    </TableRow>
                    </TableHead>
                    <TableBody>
                        {this.state.currentData != null ? 
                                this.state.currentData.map(row => (
                                        <TableRow style={ row.category === "Income" ? { backgroundColor: '#2e7d32' } : {}}  key={row.id}>
                                            <TableCell component="th" scope="row">{row.category}</TableCell>
                                            <TableCell>{row.date}</TableCell>
                                            <TableCell>{Number(row.amount).toFixed(2)}</TableCell>
                                            <TableCell>{row.remarks}</TableCell>
                                            <TableCell>
                                                <IconButton id={row.id} onClick={this.deleteTrans}>
                                                    <DeleteIcon fontSize="small"/>
                                                </IconButton>
                                            </TableCell>
                                            <TableCell>
                                                <IconButton id={row.id} onClick={this.editTrans}>
                                                    <EditIcon fontSize="small"/>
                                                </IconButton>
                                            </TableCell>
                                        </TableRow>
                                ))
                            : 
                                (
                                    <TableRow key={0}>
                                        <TableCell component="th" scope="row">{'No Data'}</TableCell>
                                        <TableCell></TableCell>
                                        <TableCell></TableCell>
                                        <TableCell></TableCell>
                                    </TableRow>
                                )
                        }
                    </TableBody>
                </Table>
                </TableContainer>
                <Snackbar open={this.state.successToast} 
                                autoHideDuration={3000}
                                onClose={this.closeSuccessToast}
                                anchorOrigin={{
                                    vertical: 'top',
                                    horizontal: 'center',
                            }}>
                        <Alert onClose={this.closeSuccessToast} severity="success">
                            {this.state.message}
                        </Alert>
                    </Snackbar>
                    <Snackbar open={this.state.failureToast} 
                                autoHideDuration={3000}
                                onClose={this.closeFailureToast}
                                anchorOrigin={{
                                    vertical: 'top',
                                    horizontal: 'center',
                            }}>
                        <Alert onClose={this.closeFailureToast} severity="error">
                            {this.state.message}
                        </Alert>
                    </Snackbar>
                    <EditTransaction parent={this} open={this.state.openEditDlg} record={this.state.currentRecord} />
            </Container>
        );
    }

}

export default TransactionTable;