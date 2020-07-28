import { format } from 'date-fns';
import React from 'react';
import AppBar from '@material-ui/core/AppBar';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import Grid from '@material-ui/core/Grid';
import IconButton from '@material-ui/core/IconButton';
import RefreshIcon from '@material-ui/icons/Refresh';

const useStyles = makeStyles((theme) => ({
    container: {
      display: 'flex',
      flexWrap: 'wrap',
    },
    textField: {
      marginLeft: theme.spacing(1),
      marginRight: theme.spacing(1),
      width: 200,
    },
  }));

export default function TopBar(props) {

    const classes = useStyles();
    return (
        <AppBar position="static">
        <Grid container justify="space-around">
            <TextField
                id="date"
                label="From Date"
                type="date"
                defaultValue={props.parent.state.fromDate}
                className={classes.textField}
                onChange={props.parent.changeFromDate}
                InputLabelProps={{
                    shrink: true,
                }}
            />
            <TextField
                id="date"
                label="To Date"
                type="date"
                defaultValue={props.parent.state.toDate}
                className={classes.textField}
                onChange={props.parent.changeToDate}
                InputLabelProps={{
                    shrink: true,
                }}
            />
             <IconButton aria-label="delete">
                <RefreshIcon 
                    onClick={props.parent.refresh}
                />
            </IconButton>
        </Grid>
        </AppBar>
    );
}