import Button from '@material-ui/core/Button';
import FormControl from '@material-ui/core/FormControl';
import Input from '@material-ui/core/Input';
import InputLabel from '@material-ui/core/InputLabel';
import Modal from '@material-ui/core/Modal';
import { makeStyles } from '@material-ui/core/styles';
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

export default function EditCategory(props) {
    const classes = useStyles();

    // handlers for the show/hide of the new transaction dialog    
    const handleDlgClose = () => {
        props.closer();
    };

    // handlers for the add edit category dialog    
    const handleCategoryNameChange = (event) => {
        props.updateCategoryName(event.target.value);
    };      
    const handleLowChange = (event) => {
        props.updateLow(event.target.value);
    };   
    const handleHighChange = (event) => {
        props.updateHigh(event.target.value);
    };     
    const submitUpdateCategory = (event) => {
        props.submitChange();
        props.closer();
    }
    const cancelTransaction = () => {
        props.closer();
    }

    var counter = 0;
    if (props.record == null) { return null; }
    return (
        <Modal
            open={props.open}
            onClose={handleDlgClose}>
            <div className={classes.paper}>
            <FormControl className={classes.formControl}>
                <InputLabel id="categories">Category Name</InputLabel>
                <Input
                    id="newName"
                    label="Category Name"
                    value={props.record.category}
                    onChange={handleCategoryNameChange}
                />
            </FormControl>
            <FormControl className={classes.formControl}>
                <InputLabel id="low">Low Percent</InputLabel>
                <Input
                    id="newLow"
                    label="Low Percent"
                    value={props.record.low}
                    onChange={handleLowChange}
                />
            </FormControl>
            <FormControl className={classes.formControl}>
                <InputLabel id="high">High Percent</InputLabel>
                <Input
                    id="newHigh"
                    label="High Percent"
                    value={props.record.high}
                    onChange={handleHighChange}
                />
            </FormControl>            
            <FormControl className={classes.formControl}>
                <Button size="small" variant="contained" color="primary" onClick={submitUpdateCategory}>Add Transaction</Button>
                <Button size="small" variant="contained" color="secondary" onClick={cancelTransaction}>Done</Button>
            </FormControl>
            </div>
        </Modal>
    )
}