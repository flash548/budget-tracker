import Button from '@material-ui/core/Button';
import FormControl from '@material-ui/core/FormControl';
import Input from '@material-ui/core/Input';
import InputAdornment from '@material-ui/core/InputAdornment';
import InputLabel from '@material-ui/core/InputLabel';
import Modal from '@material-ui/core/Modal';
import Select from '@material-ui/core/Select';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
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

export default function EditTransaction(props) {
    const classes = useStyles();

    // handlers for the show/hide of the new transaction dialog    
    const handleDlgClose = () => {
        props.parent.closeEditDlg();
    };

    // handlers for the add edit transaction dialog    
    const handleCategoriesChange = (event) => {
        props.parent.updateCurrentRecordCategory(event.target.value);
    };      
    const handleNewAmountChanged = (event) => {
        props.parent.updateCurrentRecordAmount(event.target.value);
    }
    const changeNewDate = (event) => {
        props.parent.updateCurrentRecordDate(event.target.value);    
    }  
    const handleOnAmountFocus = (event) => {
        event.target.select();
    }    
    const handleRemarksChange = (event) => {
        props.parent.updateCurrentRecordRemarks(event.target.value);
    }
    const submitUpdateTransaction =  (event) => {
        props.parent.submitUpdateTransaction();
        props.parent.closeEditDlg();
    }
    const cancelTransaction = () => {
        props.parent.closeEditDlg();
    }

    // setCategory(props.record.category);
    // setNewDate(props.record.date);
    // setNewAmount(props.record.amount);
    // setRemarks(props.record.remarks);

    var counter = 0;
    if (props.record == null) { return null; }

    return (
        <Modal
            open={props.open}
            onClose={handleDlgClose}>
            <div className={classes.paper}>
            <FormControl className={classes.formControl}>
                <InputLabel id="categories">Category</InputLabel>
                <Select
                    native
                    labelId="categoriesLabel"
                    value={props.record.category}
                    id="categoriesSelect"                            
                    onChange={handleCategoriesChange}>
                    {
                        props.parent.state.categories.map(x=> {
                            return (
                                <option key={counter++} value={x}>{x}</option>
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
                    value={props.record.date}
                    onChange={changeNewDate}
                    InputLabelProps={{ shrink: true, }}
                />
            </FormControl>
            <FormControl className={classes.formControl}>
                <InputLabel htmlFor="amount">Amount</InputLabel>
                <Input
                    id="amount"
                    onClick={handleOnAmountFocus}
                    value={props.record.amount}
                    onChange={handleNewAmountChanged} 
                    startAdornment={ <InputAdornment position="start">$</InputAdornment> }
                />
            </FormControl>
            <FormControl className={classes.formControl}>
                <TextField id="remarks" value={props.record.remarks} label="Remarks" onChange={handleRemarksChange}/>
            </FormControl>
            <FormControl className={classes.formControl}>
                <Button size="small" variant="contained" color="primary" onClick={submitUpdateTransaction}>Submit</Button>
                <Button size="small" variant="contained" color="secondary" onClick={cancelTransaction}>Done</Button>
            </FormControl>
            </div>
        </Modal>
    )
}