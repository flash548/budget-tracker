import Container from '@material-ui/core/Container';
import Paper from '@material-ui/core/Paper';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import { format } from 'date-fns';
import React from 'react';
import './App.css';
import Options from './Options';
import TopBar from './TopBar.js';
import Stats from './Stats.js';

class TransactionTable extends React.Component {

    constructor(props) {
        super(props);
        this.initial = true;
        this.state = {
            categories: [],
            activeCategories: [],
            fromAmount: null,  // null is max lower bound
            toAmount: null,    // null is max upper bound
            fromDate: format(new Date(), 'yyyy-MM-01'),
            toDate: format(new Date(), 'yyyy-MM-dd'),
            currentData: [],
        };
    }

    componentDidMount() {
        this.doDataPull();
    }

    doDataPull = async () => {
        let categoriesResp = await fetch("http://localhost:8080/categories");
        let categoriesData = await categoriesResp.json();
        categoriesData = categoriesData.map(x=> x.category);
        let resp = await fetch("http://localhost:8080/transactions",
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

        if (resp.status === 200) {
            let data = await resp.json();
            this.setState( { activeCategories: (this.initial) ? categoriesData : this.state.activeCategories,
                 categories: categoriesData, currentData: data });
        }
        else {
            this.setState( { activeCategories: (this.initial) ? categoriesData : this.state.activeCategories,
                     categories: categoriesData, currentData: null });
        }
        this.initial = false;
    }

    submitTransaction = async (trans) => {
        let resp = await fetch("http://localhost:8080/transactions/add",
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
    refresh = () => { this.doDataPull(); }
    reset = () => {
       this.setState({ fromDate: format(new Date(), 'yyyy-MM-01'),
                        toDate: format(new Date(), 'yyyy-MM-dd'),
                        fromAmount: null,
                        toAmount: null});
       this.initial = true;
       this.doDataPull();
    }
    render() {
        return (
            <Container maxWidth="sm">
                <TopBar parent={this}/>
                <Options parent={this}/>
                <Stats parent={this}/>
                <TableContainer component={Paper}>
                <Table size="small">
                    <TableHead>
                    <TableRow>
                        <TableCell>Category</TableCell>
                        <TableCell>Date</TableCell>
                        <TableCell>Amount</TableCell>
                        <TableCell>Remarks</TableCell>
                    </TableRow>
                    </TableHead>
                    <TableBody>
                        {this.state.currentData != null ? 
                                this.state.currentData.map(row => (
                                        <TableRow key={row.id}>
                                            <TableCell component="th" scope="row">{row.category}</TableCell>
                                            <TableCell>{row.date}</TableCell>
                                            <TableCell>{row.amount}</TableCell>
                                            <TableCell>{row.remarks}</TableCell>
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
            </Container>
        );
    }

}

export default TransactionTable;