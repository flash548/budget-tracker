import { format } from 'date-fns';
import React, { useState } from 'react';
import './App.css';
import { makeStyles } from '@material-ui/core/styles';
import { createMuiTheme } from '@material-ui/core/styles';
import { ThemeProvider } from '@material-ui/styles';
import { CssBaseline } from '@material-ui/core';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import Container from '@material-ui/core/Container';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import TopBar from './TopBar.js';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Options from './Options';



class TransactionTable extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            categories: [],
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
        console.log(JSON.stringify({
            categories: categoriesData,
            fromAmount: this.state.fromAmount,
            toAmount: this.state.toAmount,
            fromDate: this.state.fromDate,
            toDate: this.state.toDate,
        })                );
        let resp = await fetch("http://localhost:8080/transactions",
            {
                method: 'POST', // *GET, POST, PUT, DELETE, etc.
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    categories: categoriesData,
                    fromAmount: this.state.fromAmount,
                    toAmount: this.state.toAmount,
                    fromDate: this.state.fromDate,
                    toDate: this.state.toDate,
                })                
            });

        if (resp.status == 200) {
            let data = await resp.json();
            this.setState( { categories: categoriesData, currentData: data });
        }
        else {
            this.setState( { categories: categoriesData, currentData: null });
        }
    }

    changeFromDate = (event) => { console.log(event.target.value); this.setState( { fromDate: event.target.value } ) }
    changeToDate = (event) => { this.setState( { toDate: event.target.value } ) }
    refresh = (event) => { this.doDataPull(); }

    render() {
        console.log(this.state.currentData);
        return (
            <Container maxWidth="sm">
                
                <TopBar parent={this}/>
                <Options parent={this}/>

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