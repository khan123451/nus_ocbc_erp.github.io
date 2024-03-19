var revenueList = [10045624, 32056711, 781726, 65756111, 2000, 200];
var expenditureList = [1004564, 3204511, 781726, 657411];

function listSum(myList) {
    // create a variable for the sum and initialize it
    let sum = 0;

    // iterate over each item in the array
    for (let i = 0; i < myList.length; i++) {
        sum += myList[i];
    }
    return sum;
}

document.getElementById('totalRevenue').innerHTML = 'SGD$' + listSum(revenueList);
document.getElementById('totalExpenditure').innerHTML = 'SGD$' + listSum(expenditureList);

// Sample data for the charts
const balanceData = {
    labels: ['January', 'February', 'March', 'April'],
    datasets: [{
        label: 'Account Balance ($)',
        data: [1000, 1500, 1000, 2000],
        fill: false,
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
    }]
};

const expenditureData = {
    labels: ['Branch 1', 'Branch 2', 'Branch 3', 'Other'],
    datasets: [{
        label: 'Expenditure',
        data: expenditureList,
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
        ],
        borderWidth: 1
    }]
};

const revenueData = {
    labels: ['Save', 'Loan', 'Debt', 'Stock Investment', 'Bond', 'Other'],
    datasets: [{
        label: 'SGD',
        data: revenueList,
        backgroundColor: [
            'rgba(255, 99, 132, 0.5)',
            'rgba(54, 162, 235, 0.5)',
            'rgba(255, 206, 86, 0.5)',
            'rgba(75, 192, 192, 0.5)',
        ]
    }]
};

// Options for the charts
const options = {
    animation: {
        duration: 1500, // general animation time
    },
    hover: {
        animationDuration: 1000, // duration of animations when hovering an item
    },
    responsiveAnimationDuration: 1000, // animation duration after a resize
};

// Create the charts using Chart.js
new Chart(document.getElementById('balanceChart'), {
    type: 'line',
    data: balanceData,
    options: options
});

new Chart(document.getElementById('expenditurePieChart'), {
    type: 'pie',
    data: expenditureData,
    options: options
});

new Chart(document.getElementById('revenueBarChart'), {
    type: 'bar',
    data: revenueData,
    options: options
});