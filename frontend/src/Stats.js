import Accordion from '@material-ui/core/Accordion';
import AccordionDetails from '@material-ui/core/AccordionDetails';
import AccordionSummary from '@material-ui/core/AccordionSummary';
import Grid from '@material-ui/core/Grid';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import React from 'react';
import Paper from '@material-ui/core/Paper';

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
    
    return (
        <div className={classes.root}>
        <Accordion className={classes.root}>
          <AccordionSummary expandIcon={ <ExpandMoreIcon /> }>
            <Typography className={classes.heading}>Stats</Typography>            
          </AccordionSummary>
          <AccordionDetails> 
            <div  className={classes.root}>
            <Grid container align="center" justify="center" spacing={3}>
                <Grid item xs={6}>
                    <Paper className={classes.paper}>xs=6</Paper>
                </Grid>
                <Grid item xs={6}>
                    <Paper className={classes.paper}>xs=6</Paper>
                </Grid>
                <Grid item xs={6}>
                    <Paper className={classes.paper}>xs=6</Paper>
                </Grid>
            </Grid>
          </div>
          </AccordionDetails>
        </Accordion>
      </div>
    )
};