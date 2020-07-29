import AppBar from '@material-ui/core/AppBar';
import Button from '@material-ui/core/Button';
import FormControl from '@material-ui/core/FormControl';
import Grid from '@material-ui/core/Grid';
import IconButton from '@material-ui/core/IconButton';
import Input from '@material-ui/core/Input';
import InputAdornment from '@material-ui/core/InputAdornment';
import InputLabel from '@material-ui/core/InputLabel';
import Modal from '@material-ui/core/Modal';
import Select from '@material-ui/core/Select';
import Snackbar from '@material-ui/core/Snackbar';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Typography from '@material-ui/core/Typography';
import AddIcon from '@material-ui/icons/Add';
import ClearAllIcon from '@material-ui/icons/ClearAll';
import RefreshIcon from '@material-ui/icons/Refresh';
import MuiAlert from '@material-ui/lab/Alert';
import { format } from 'date-fns';
import React from 'react';

const useStyles = makeStyles((theme) => ({
    container: {
      display: 'flex',
      flexWrap: 'wrap',
    },
    heading: {
        fontSize: theme.typography.pxToRem(15),
        fontWeight: theme.typography.fontWeightRegular,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center"
    },
    paper: {
        position: 'absolute',
        width: 400,
        backgroundColor: theme.palette.background.paper,
        border: '2px solid #000',
        boxShadow: theme.shadows[5],
        padding: theme.spacing(2, 4, 3),
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
      },
      formControl: {
        margin: theme.spacing(1),
        minWidth: 120,
      },
  }));

export default function TopBar(props) {

    const classes = useStyles();
    const [category, setCategory] = React.useState('');
    const [newDate, setNewDate] = React.useState(format(new Date(), 'yyyy-MM-dd'));
    const [newAmount, setNewAmount] = React.useState('0.00');
    const [remarks, setRemarks] = React.useState('');
    const [open, setOpen] = React.useState(false);
    const [successToast, setSuccessToast] = React.useState(false);
    const [failureToast, setFailureToast] = React.useState(false);

    // handlers for the show/hide of the new transaction dialog    
    const handleDlgOpen = () => {
        setOpen(true);
    };
    const handleDlgClose = () => {
        setOpen(false);

        // dlg close we reset the fields for next time
        setCategory('');
        setNewDate(format(new Date(), 'yyyy-MM-dd'));
        setNewAmount('0.00');
        setRemarks('');
    };

    // handlers for the add new transaction dialog    
    const handleCategoriesChange = (event) => {
        setCategory(event.target.value);
    };    
    const changeNewDate = (event) => {
        setNewDate(event.target.value);    
    }    
    const handleNewAmountChanged = (event) => {
        setNewAmount(event.target.value);
    }
    const handleOnAmountFocus = (event) => {
        event.target.select();
    }    
    const handleRemarksChange = (event) => {
        setRemarks(event.target.value);
    }
    const submitTransaction = async (event) => {
        // TODO: check that a category was chosen...
        if (category === '') {
            openFailureToast(); 
            return;
        }

        let result = await props.parent.submitTransaction({
            category: category,
            date: newDate,
            amount: newAmount,
            remarks: remarks,
        });

        if (result) {
            // show success toast
            openSuccessToast();
        }
        else {
            // show failure toast
            openFailureToast();
        }
    }
    const cancelTransaction = () => {
        setOpen(false); 
    }
    const openSuccessToast = () => {
        setSuccessToast(true);
    }

    // handlers for the success or failure Toast
    //  from adding a transaction
    const closeSuccessToast = () => {
        setSuccessToast(false);
    } 
    const openFailureToast = () => {
        setFailureToast(true);
    }
    const closeFailureToast = () => {
        setFailureToast(false);
    }

    // custom control taken from Material UI website example...
    function Alert(props) {
        return <MuiAlert elevation={6} variant="filled" {...props} />;
    }

    return (
        <AppBar position="static">
        <Grid container justify="space-around">
            <Typography align="center" className={classes.heading}>Budget Tracker</Typography> 
             <IconButton onClick={props.parent.refresh}>
                <RefreshIcon />
            </IconButton>
            <IconButton onClick={props.parent.reset}>
                <ClearAllIcon />
            </IconButton>
            <IconButton onClick={handleDlgOpen}>
                <AddIcon />
            </IconButton>
            <Modal
                open={open}
                onClose={handleDlgClose}
                aria-labelledby="simple-modal-title"
                aria-describedby="simple-modal-description">
                    <div className={classes.paper}>
                    <FormControl className={classes.formControl}>
                        <InputLabel id="categories">Category</InputLabel>
                        <Select
                            native
                            labelId="categoriesLabel"
                            value={category}
                            id="categoriesSelect"                            
                            onChange={handleCategoriesChange}>
                            <option aria-label="None" value="" />
                            {
                                props.parent.state.categories.map(x=> {
                                    return (
                                        <option value={x}>{x}</option>
                                    )
                                })
                            }
                        </Select>
                    </FormControl>
                    <FormControl className={classes.formControl}>
                        <TextField
                            id="newDate"
                            label="Date"
                            type="date"
                            value={format(new Date(), 'yyyy-MM-dd')}
                            onChange={changeNewDate}
                            InputLabelProps={{ shrink: true, }}
                        />
                    </FormControl>
                    <FormControl className={classes.formControl}>
                        <InputLabel htmlFor="amount">Amount</InputLabel>
                        <Input
                            id="amount"
                            onClick={handleOnAmountFocus}
                            value={newAmount}
                            onChange={handleNewAmountChanged} 
                            startAdornment={ <InputAdornment position="start">$</InputAdornment> }
                        />
                    </FormControl>
                    <FormControl className={classes.formControl}>
                        <TextField id="remarks" label="Remarks" onChange={handleRemarksChange}/>
                    </FormControl>
                    <FormControl className={classes.formControl}>
                        <Button size="small" variant="contained" color="primary" onClick={submitTransaction}>Add Transaction</Button>
                        <Button size="small" variant="contained" color="secondary" onClick={cancelTransaction}>Done</Button>
                    </FormControl>
                    <Snackbar open={successToast} 
                                autoHideDuration={3000}
                                onClose={closeSuccessToast}
                                anchorOrigin={{
                                    vertical: 'top',
                                    horizontal: 'center',
                            }}>
                        <Alert onClose={closeSuccessToast} severity="success">
                            Transaction Added!
                        </Alert>
                    </Snackbar>
                    <Snackbar open={failureToast} 
                                autoHideDuration={3000}
                                onClose={closeFailureToast}
                                anchorOrigin={{
                                    vertical: 'top',
                                    horizontal: 'center',
                            }}>
                        <Alert onClose={closeFailureToast} severity="error">
                            Transaction Failed!
                        </Alert>
                    </Snackbar>
                    </div>
            </Modal>
        </Grid>
        </AppBar>
    );
}