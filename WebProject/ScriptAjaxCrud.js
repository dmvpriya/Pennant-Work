$(document).ready(function () {
    var apidata;
    var i = 1;
    var j; 
    var value;
    

    $.ajax({
        url: 'https://reqres.in/api/users?page=2',
        type: 'GET',
        success: function (response) {
            apidata = response.data;
            j = apidata.length-1;
        }
    });
   


    $("#first").click(function () {
        if (apidata && apidata.length > 0) {
            var firstRowData = apidata[0];
            $('#u_id').text(firstRowData.id);
            $('#u_name').text(firstRowData.first_name + ' ' + firstRowData.last_name);
            $('.DivTop').show();
        } else {
            console.log("No data available.");
        }
    });
    $("#next").click(function () {
        if (apidata && apidata.length > 0) {
            
            var firstRowData = apidata[i++];
            $('#u_id').text(firstRowData.id);
            $('#u_name').text(firstRowData.first_name + ' ' + firstRowData.last_name);
        } else {
            console.log("No data available.");
        }
    });
    $("#last").click(function () {
        if (apidata && apidata.length > 0) {
            
            var firstRowData = apidata[apidata.length-1];
            $('#u_id').text(firstRowData.id);
            $('#u_name').text(firstRowData.first_name + ' ' + firstRowData.last_name);
        } else {
            console.log("No data available.");
        }
    });
    $("#previous").click(function () {

        if (apidata && apidata.length > 0) {
            j--;
            var firstRowData = apidata[j];
            $('#u_id').text(firstRowData.id);
            $('#u_name').text(firstRowData.first_name + ' ' + firstRowData.last_name);
            
        } else {
            console.log("No data available.");
        }
    });
    $("#create").click(function () {
        var newId = $("#u_id").text();
        var newName = $('#u_name').text();

        if (apidata && apidata.length > 0) {
            var newData = {
                id : newId,
                first_name :  newName.split('')[0],
                last_name : newName.split('')[1]
            }
            apidata.push(newData);
            alert("New record added");
            console.log('new Data added :'+newData);
           
        } else {
            console.log("No data available.");
        }
    });

    $("#read").click(function () {
        if (apidata && apidata.length > 0) {
            $('#tbody').empty(); // Clear previous data

                apidata.forEach(function(record) {
                var row = $('<tr>');
                row.append($('<td>').text(record.id));
                row.append($('<td>').text(record.first_name + ' ' + record.last_name));
                row.append($('<td>').text(record.avatar));
                $('#tbody').append(row);
         });

        $('.tableContainer').show();
        } else {
            console.log("No data available.");
        }
    });
    $("#delete").click(function () {
        var newId = $("#u_id").text();
        if (apidata && apidata.length > 0) {            
            apidata = apidata.filter(function(record){
                return record.id != newId;
            })           
            alert('Record deleted');
        } else {
            console.log("No data available.");
        }

    });
    $("#update").click(function () {
        var newId = $("#u_id").text();
        var newName = $('#u_name').text();
    
        if (apidata && apidata.length > 0) {
            var index = apidata.findIndex(function(record) {
                return record.id === newId;
            });
    
            if (index !== -1) {
                apidata[index].first_name = newName.split(' ')[0];
                apidata[index].last_name = newName.split(' ')[1];
                console.log("Record with ID " + newId + " updated successfully.");
                console.log("Updated apidata:", apidata);
            } else {
                console.log("Record with ID " + newId + " not found.");
            }
        } else {
            console.log("No data available.");
        }
    });
    

    
});