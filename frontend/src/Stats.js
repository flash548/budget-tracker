import Accordion from '@material-ui/core/Accordion';
import AccordionDetails from '@material-ui/core/AccordionDetails';
import AccordionSummary from '@material-ui/core/AccordionSummary';
import Grid from '@material-ui/core/Grid';
import Paper from '@material-ui/core/Paper';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableCell from '@material-ui/core/TableCell';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import Typography from '@material-ui/core/Typography';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import Alert from '@material-ui/lab/Alert';
import React from 'react';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    background: '#002984',
    width: '100%',
  },
  paper: {
    border: '1px solid',
    padding: theme.spacing(1),
    backgroundColor: theme.palette.background.paper,
  },
  margin: {
    margin: theme.spacing(1),
  },
}));

export default function Stats(props) {
    const classes = useStyles();
    var counter = 0;

    return (
        <div className={classes.root}>
        <Accordion className={classes.root}>
          <AccordionSummary expandIcon={ <ExpandMoreIcon /> }>
            <Typography className={classes.heading}>Stats</Typography>            
          </AccordionSummary>
          <AccordionDetails> 
            <div  className={classes.root}>
            <Grid container align="center" justify="center" spacing={1}>
                {
                    props.parent.state.ranges ? 
                        props.parent.state.ranges.map(x => 
                            (  
                                <Grid item xs={12} key={counter++}>
                                <Alert style={{padding: 'none'}} variant="filled" severity={
                                    (props.parent.state.percentages[x.category] < x.low ? "success" :
                                        x.low <= props.parent.state.percentages[x.category] && props.parent.state.percentages[x.category] <= x.high ? "warning" :
                                        "error")}>
                                    <Table size="small">
                                    <TableBody>
                                        <TableRow>
                                        <TableCell>
                                            {x.category}
                                        </TableCell>
                                        <TableCell>
                                            {props.parent.state.totals[x.category]}
                                        </TableCell>
                                        <TableCell>
                                            {`${props.parent.state.percentages[x.category]}%`}
                                        </TableCell>
                                        <TableCell>
                                        {`${x.low}%-${x.high}%`}
                                        </TableCell>
                                        </TableRow>
                                    </TableBody>
                                    </Table>
                                </Alert>
                                </Grid> 
                            )
                        )
                        :
                        ( 
                            <Grid item xs={6}>
                                <Paper className={classes.paper}>No Range Data</Paper>
                            </Grid> 
                        ) 
                }
            </Grid>
          </div>
          </AccordionDetails>
        </Accordion>
      </div>
    )
};