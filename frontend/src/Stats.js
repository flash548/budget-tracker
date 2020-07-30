import Accordion from "@material-ui/core/Accordion";
import AccordionDetails from "@material-ui/core/AccordionDetails";
import AccordionSummary from "@material-ui/core/AccordionSummary";
import IconButton from "@material-ui/core/IconButton";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import Typography from "@material-ui/core/Typography";
import AddIcon from "@material-ui/icons/Add";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import React, { useState } from "react";
import EditCategory from "./EditCategory";


const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
        background: "#002984",
        width: "100%",
    },
    paper: {
        border: "1px solid",
        padding: theme.spacing(1),
        backgroundColor: theme.palette.background.paper,
    },
    margin: {
        margin: theme.spacing(1),
    },
}));

export default function Stats(props) {
    const classes = useStyles();
    const [openEditDlg, setOpenEditDlg] = useState(false);

    // state trackers for editing category/ranges...
    const [currentCategory, setCurrentCategory] = useState(null);
    const [currentLow, setCurrentLow] = useState(null);
    const [currentHigh, setCurrentHigh] = useState(null);
    const [oldCategory, setOldCategory] = useState(null);

    // state trackers for adding new category...
    const [openNewCategoryDlg, setOpenNewCategoryDlg] = useState(null);

    // handles the delete category request
    const deleteCategory = (event) => {
        props.parent.deleteCategory(event.currentTarget.id.split("-")[0]);
    };

    // functions to handle edit/change category/ranges option...
    const editCategory = (event) => {
        for (let rec of props.parent.state.ranges) {
            if (rec.category == event.currentTarget.id) {
                //setCurrentRecord({...rec});
                setOldCategory(rec.category);
                setCurrentCategory(rec.category);
                setCurrentLow(rec.low);
                setCurrentHigh(rec.high);
                setOpenEditDlg(true);
                return;
            }
        }
    };
    const updateCategoryNameVal = (name) => {
        setCurrentCategory(name);
    };
    const updateLowVal = (val) => {
        setCurrentLow(val);
    };
    const updateHighVal = (val) => {
        setCurrentHigh(val);
    };
    const closeEditDlg = () => {
        setOpenEditDlg(false);
    };
    const updateCategoryRange = () => {
        props.parent.editCategoryNameRange({
            oldName: oldCategory,
            newName: currentCategory,
            newLow: currentLow,
            newHigh: currentHigh,
        });
        setOpenEditDlg(false);
    };

    // functions to handle adding whole new category...
    const showAddNewCategory = (event) => {
        setCurrentCategory("");
        setCurrentLow("");
        setCurrentHigh("");
        setOpenNewCategoryDlg(true);
        return;
    };
    const closeNewCategoryDlg = () => {
        setOpenNewCategoryDlg(false);
    };
    const addNewCategoryAndRange = () => {
        props.parent.addNewCategoryAndRange({
            newName: currentCategory,
            newLow: currentLow,
            newHigh: currentHigh,
        });
        setOpenNewCategoryDlg(false);
    };

    return (
        <div className={classes.root}>
            <Accordion className={classes.root}>
                <AccordionSummary expandIcon={<ExpandMoreIcon />}>
                    <Typography className={classes.heading}>Stats</Typography>                    
                </AccordionSummary>
                <AccordionDetails>
                    <div className={classes.root}>
                        <IconButton onClick={showAddNewCategory}>
                            <AddIcon fontSize="small" />
                            <Typography>Add New Category</Typography>
                        </IconButton>
                        <Table width="100%" padding="none" size="small">
                            <TableBody>
                                {props.parent.state.ranges ? (
                                    props.parent.state.ranges.filter(x=> props.parent.state.activeCategories.includes(x.category))
                                        .map((x) => (
                                        <TableRow
                                            style={{
                                                backgroundColor:
                                                    props.parent.state
                                                        .percentages[
                                                        x.category
                                                    ] <= x.high
                                                        ? "#60ad5e"
                                                        : "#f05545",
                                            }}
                                        >
                                            <TableCell>{x.category}</TableCell>
                                            <TableCell>
                                                {
                                                    props.parent.state.totals[
                                                        x.category
                                                    ]
                                                }
                                            </TableCell>
                                            <TableCell>
                                                {`${
                                                    props.parent.state
                                                        .percentages[x.category]
                                                }%`}
                                            </TableCell>
                                            <TableCell>
                                                {`${x.low}%-${x.high}%`}
                                            </TableCell>
                                            <TableCell>
                                                <IconButton
                                                    id={`${x.category}-delete`}
                                                    onClick={deleteCategory}
                                                >
                                                    <DeleteIcon fontSize="small" />
                                                </IconButton>
                                            </TableCell>
                                            <TableCell>
                                                <IconButton
                                                    id={x.category}
                                                    onClick={editCategory}
                                                >
                                                    <EditIcon fontSize="small" />
                                                </IconButton>
                                            </TableCell>
                                        </TableRow>
                                    ))
                                ) : (
                                    <TableRow>
                                        <TableCell>
                                            <Paper className={classes.paper}>
                                                No Range Data
                                            </Paper>
                                        </TableCell>
                                    </TableRow>
                                )}
                            </TableBody>
                        </Table>                        
                    </div>
                </AccordionDetails>
            </Accordion>
            <EditCategory
                closer={closeEditDlg}
                updateCategoryName={updateCategoryNameVal}
                updateLow={updateLowVal}
                updateHigh={updateHighVal}
                submitChange={updateCategoryRange}
                open={openEditDlg}
                record={{
                    category: currentCategory,
                    low: currentLow,
                    high: currentHigh,
                }}
            />
            <EditCategory
                closer={closeNewCategoryDlg}
                updateCategoryName={updateCategoryNameVal}
                updateLow={updateLowVal}
                updateHigh={updateHighVal}
                submitChange={addNewCategoryAndRange}
                open={openNewCategoryDlg}
                record={{
                    category: currentCategory,
                    low: currentLow,
                    high: currentHigh,
                }}
            />
        </div>
    );
}
