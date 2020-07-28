import React from 'react';
import './App.css';
import { makeStyles } from '@material-ui/core/styles';
import { createMuiTheme } from '@material-ui/core/styles';
import { ThemeProvider } from '@material-ui/styles';
import { CssBaseline } from '@material-ui/core';
import TransactionTable from './TransactionTable'

const useStyles = makeStyles((theme) => ({
    root: {
            flexGrow: 1,
        }
}));

const darkTheme = createMuiTheme({
    palette: {
      type: 'dark',
    },
});

function App() {

    const classes = useStyles();
    return (
        <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <div className={classes.root}>
            <TransactionTable />
        </div>
        </ThemeProvider>
    );
}


export default App;
