import { Popover } from '@material-ui/core';
import Accordion from '@material-ui/core/Accordion';
import AccordionDetails from '@material-ui/core/AccordionDetails';
import AccordionSummary from '@material-ui/core/AccordionSummary';
import Button from '@material-ui/core/Button';
import Checkbox from '@material-ui/core/Checkbox';
import Container from '@material-ui/core/Container';
import FormControl from '@material-ui/core/FormControl';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Grid from '@material-ui/core/Grid';
import Input from '@material-ui/core/Input';
import InputAdornment from '@material-ui/core/InputAdornment';
import InputLabel from '@material-ui/core/InputLabel';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Typography from '@material-ui/core/Typography';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import React from 'react';


const useStyles = makeStyles((theme) => ({
  root: {
    background: '#002984',
    width: '100%',
    flexWrap: 'wrap',
  },
  heading: {
    fontSize: theme.typography.pxToRem(15),
    fontWeight: theme.typography.fontWeightRegular,
  },
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
  },
  selectEmpty: {
    marginTop: theme.spacing(2),
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

export default function Options(props) {
    const classes = useStyles();
    const handleCheckChange = (event) => { props.parent.toggleCat(event.target.name);  };

    
    const [anchorEl, setAnchorEl] = React.useState(null);
    const open = Boolean(anchorEl);
    const handleClose = () => { setAnchorEl(null); };
    const handleClick = (event) => { setAnchorEl(anchorEl ? null : event.currentTarget); };
    const handleSelectAll = (event) => { props.parent.toggleAllCats(true); }
    const handleDeSelectAll = (event) => { props.parent.toggleAllCats(false); }
    const handleLowAmountChange = (event) => { props.parent.changeFromAmount(event.target.value) };
    const handleHighAmountChange = (event) => { props.parent.changeToAmount(event.target.value) };
    const handleOnFocus = (event) => { event.target.select(); }

    var counter = 0;
    return (
      <div>
        <Accordion className={classes.root}>
          <AccordionSummary expandIcon={ <ExpandMoreIcon /> } id="panel1a-header">
            <Typography className={classes.heading}>Filter</Typography>
            <Grid container justify="space-around">
                <TextField
                    id="date"
                    label="From Date"
                    type="date"
                    value={props.parent.state.fromDate}
                    className={classes.textField}
                    onChange={props.parent.changeFromDate}
                    InputLabelProps={{ shrink: true, }}
                />
                <TextField
                    id="date"
                    label="To Date"
                    type="date"
                    value={props.parent.state.toDate}
                    className={classes.textField}
                    onChange={props.parent.changeToDate}
                    InputLabelProps={{ shrink: true,}}/>
            </Grid>
          </AccordionSummary>
          <AccordionDetails> 
            <div>
            <Grid container align="center" justify="center" spacing={2}>
                <Grid key={1} item>
                <Button size="small" variant="contained" color="primary" onClick={handleClick}>Categories</Button>
                <Popover id={'categories'} open={open} anchorEl={anchorEl} 
                    onClose={handleClose}
                    anchorOrigin={{
                        vertical: 'bottom',
                        horizontal: 'center',
                    }}
                    transformOrigin={{
                        vertical: 'top',
                        horizontal: 'center',
                    }}>
                    <Container className={classes.paper} maxWidth="xs">
                    <Button size="small" variant="contained" color="primary" onClick={handleSelectAll}>Select All</Button>
                    <Button size="small" variant="contained" color="primary" onClick={handleDeSelectAll}>Deselect All</Button><br/>
                    <br/>
                    { 
                        props.parent.state.categories.map((x) => { 
                        return (
                            <FormControlLabel key={counter++} 
                                control={ 
                                    <Checkbox checked={props.parent.state.activeCategories.includes(x)}
                                        name={x} 
                                        color="primary"
                                        onChange={handleCheckChange}/> 
                                }
                                label={x}/>)
                        })
                    }
                    </Container>
                </Popover>
                </Grid>
                <Grid id={2}>
                    <FormControl className={classes.margin}>
                    <InputLabel htmlFor="low-amount">Lower Bound</InputLabel>
                    <Input
                        id="low-amount"
                        onClick={handleOnFocus}
                        value={props.parent.state.fromAmount == null ? "None" : props.parent.state.fromAmount}
                        onChange={handleLowAmountChange}
                        startAdornment={ <InputAdornment position="start">$</InputAdornment> }
                    />
                    </FormControl>
                </Grid>
                <Grid id={3}>
                    <FormControl className={classes.margin}>
                    <InputLabel htmlFor="high-amount">Upper Bound</InputLabel>
                    <Input
                        id="high-amount"
                        onClick={handleOnFocus}
                        value={props.parent.state.toAmount == null ? "None" : props.parent.state.toAmount}
                        onChange={handleHighAmountChange} 
                        startAdornment={ <InputAdornment position="start">$</InputAdornment> }
                    />
                    </FormControl>
                </Grid>
            </Grid>
          </div>
          </AccordionDetails>
        </Accordion>
      </div>
    );
  }
