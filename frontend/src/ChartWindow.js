import { format } from "date-fns";
import React from "react";
import Modal from "@material-ui/core/Modal";
import Chart from "react-google-charts";
import Button from "@material-ui/core/Button";
import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
    paper: {
        position: "absolute",
        width: 600,
        //height: 600,
        backgroundColor: theme.palette.background.paper,
        border: "2px solid #000",
        boxShadow: theme.shadows[5],
        padding: theme.spacing(2, 4, 3),
        top: "50%",
        left: "50%",
        transform: "translate(-50%, -50%)",
    },
}));

const options = {
    title: "Summary",
    curveType: "function",
    legend: { position: "bottom" },
};

const calcData = (data) => {
    // get uniq set of categories
    var categories = {};
    for (let c in data) {
        categories[data[c].category] = 1;
    }

    // get the oldest month in the data set
    var oldest = Number(data[0].date.split("-")[1]);

    // get the newest month in the data set
    var newest = Number(data[data.length - 1].date.split("-")[1]);

    // build the array of months we have to tally
    var dateRange = [];
    for (let i = oldest; i <= newest; i++) {
        dateRange.push(i);
    }

    // for each month
    // iterate over each category and sum it

    // example format of 'totals' object's endstate....
    // {
    //     "6": {
    //         "utilities": 100,
    //         "transportation": 200,
    //     },

    //     "7": {
    //         "utilities": 50,
    //         "transportation": 250,
    //     }
    // }
    var totals = {};
    for (let month of dateRange) {
        totals[month.toString()] = {};
        for (let category of Object.keys(categories)) {
            let dataSet = data.filter(
                (x) =>
                    x.category == category &&
                    Number(x.date.split("-")[1]) == month
            );
            let mappedSet = dataSet.map((x) => x.amount);
            if (mappedSet && mappedSet.length > 0) {
                let total = mappedSet.reduce((a, b) => a + b);
                totals[month.toString()][category] = total;
            } else {
                totals[month.toString()][category] = 0.0;
            }
        }
    }

    // now map the totals object to an object with the keys
    // resolved to actual month names
    var monthNames = {
        1: "Jan",
        2: "Feb",
        3: "Mar",
        4: "Apr",
        5: "May",
        6: "Jun",
        7: "Jul",
        8: "Aug",
        9: "Sep",
        10: "Oct",
        11: "Nov",
        12: "Dec",
    };

    // now pretty this up for Google Charts
    var chartData = [];
    chartData.push(["Months"].concat(Object.keys(categories))); // curves

    let row = [];
    for (let month of dateRange) {
        row = [];
        row.push(monthNames[month]);
        for (let i = 1; i < chartData[0].length; i++) {
            row.push(totals[month.toString()][chartData[0][i]]);
        }
        chartData.push(row);
    }

    return chartData;
};

export default function ChartWindow(props) {
    const classes = useStyles();
    const closeDlg = () => {
        props.closeDlg();
    };

    if (props.data == null || props.data.length == 0) {
        return null;
    }

    return (
        <Modal open={props.open} onClose={closeDlg}>
            <div className={classes.paper}>
                <Chart
                    chartType="LineChart"
                    width="100%"
                    height="400px"
                    data={calcData(props.data)}
                    options={options}
                />
                <Button
                    size="small"
                    variant="contained"
                    color="secondary"
                    onClick={closeDlg}
                >
                    Done
                </Button>
            </div>
        </Modal>
    );
}
