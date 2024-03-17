<!DOCTYPE html>
<%@page import="com.kavisoft.web.abclaboratories.model.Technician"%>
<%@page import="com.kavisoft.web.abclaboratories.model.Doctor"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Test Result Form</title>
    <!-- Replace Bulma with Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Add your custom styles here -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #3273dc;
        }

        h2 {
            color: #555555;
        }

        p {
            line-height: 1.6;
        }
    </style>
</head>

<body>
    <div class="container">
      	<% 
      	int type = (int) request.getAttribute("type");
        int appointment = (int) request.getAttribute("appointment");
        
        String testName=null;
        if(type==1){
        	testName="Blood Test";
        }else if(type==2){
        	testName="Cholesterol Test";
        }
        
        String test1="";
        String test2="";
        String test3="";
        String test4="";
        
        String unit1="";
        String unit2="";
        String unit3="";
        String unit4="";
        
        String ref1="";
        String ref2="";
        String ref3="";
        String ref4="";
        
        if(type==1){
        	test1="Red Blood Cell Count (RBC)";
        	test2="Hemoglobin (Hb)";
        	test3="White Blood Cell Count (WBC)";
        	test4="Platelet Count";
        	
        	unit1="M/mcL";
        	unit2="g/dL";
        	unit3="K/uL";
        	unit4="K/uL";
        	
        	ref1="4.5 - 5.9 M/mcL";
        	ref2="13.5 - 17.5 g/dL";
        	ref3="4.5 - 11.0 K/uL";
        	ref4="150 - 450 K/uL";
        }else if(type==2){
        	test1="Total Cholesterol";
        	test2="LDL Cholesterol";
        	test3="HDL Cholesterol";
        	test4="Triglycerides";
        	
        	unit1="mg/dL";
        	unit2="mg/dL";
        	unit3="mg/dL";
        	unit4="mg/dL";
        	
        	ref1="Less than 200 mg/dL";
        	ref2="Less than 130 mg/dL";
        	ref3="Greater than 40 mg/dL";
        	ref4="Less than 150 mg/dL";

        }
        %>
        <br />
        <h1 class="text-4xl text-primary text-center mt-4">ABC Laboratories</h1>

        <h1 class="text-2xl text-center"><%=testName %> Medical Report</h1>
        <br />
        <p><strong>Appointment ID: <%=appointment %></strong> </p>

        <h2 class="text-lg">Test Results</h2>
        <table class="table-auto w-full">
            <thead>
                <tr>
                    <th class="px-4 py-2">Test</th>
                    <th class="px-4 py-2">Result</th>
                    <th class="px-4 py-2">Reference Range</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="px-4 py-2"><%=test1 %></td>
                    <td class="px-4 py-2 flex items-center">
                        <input type="number" step="0.01" name="result1" id="result1"
                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="result" required />
                        <span class="ml-2"><%=unit1 %></span>
                    </td>
                    <td class="px-4 py-2"><%=ref1 %></td>
                </tr>
                <tr>
                    <td class="px-4 py-2"><%=test2 %></td>
                    <td class="px-4 py-2 flex items-center">
                        <input type="number" step="0.01" name="result2" id="result2"
                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="result" required />
                        <span class="ml-2"><%=unit2 %></span>
                    </td>
                    <td class="px-4 py-2"><%=ref2 %></td>
                </tr>
                <tr>
                    <td class="px-4 py-2"><%=test3 %></td>
                    <td class="px-4 py-2 flex items-center">
                        <input type="number" step="0.01" name="result3" id="result3"
                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="result" required />
                        <span class="ml-2"><%=unit3 %></span>
                    </td>
                    <td class="px-4 py-2"><%=ref3 %></td>
                </tr>
                <tr>
                    <td class="px-4 py-2"><%=test4 %></td>
                    <td class="px-4 py-2 flex items-center">
                        <input type="number" step="0.01" name="result4" id="result4"
                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="result" required />
                        <span class="ml-2"><%=unit4 %></span>
                    </td>
                    <td class="px-4 py-2"><%=ref4 %></td>
                </tr>
            </tbody>
        </table>

        <h2 class="text-lg">Doctor's Comments</h2>
        <textarea id="comment" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"></textarea>
        <br />
        <div class="flex justify-between">
            <div class="w-1/2 flex items-center">
                <span class="ml-2">Technician: </span>
                <select id="technician" name="technician"
                    class="block w-full px-4 py-2 mt-1 text-sm border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                  	 <option value="">Select</option>                    
                    <% // Access the list of technicians from the model
				List<Technician> technicians = (List<Technician>) request.getAttribute("technicians");
																			
				for (Technician technician : technicians) {
				%>

					<option value="<%=technician.getId()%>"><%=technician.getName() %></option>														

          <% } %>
                </select>
            </div>
            <div class="w-1/2 flex items-center">
                <span class="ml-2">Doctor: </span>
                <select id="doctor" name="doctor"
                    class="block w-full px-4 py-2 mt-1 text-sm border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <option value="">Select</option>
          <% // Access the list of doctors from the model
				List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
																			
				for (Doctor doctor : doctors) {
				%>

					<option value="<%=doctor.getId()%>"><%=doctor.getName() %></option>														

          <% } %>
                    
                </select>
            </div>
        </div>
        <br />
        <div class="content">
            <p><strong>Note:</strong> <small>This report is for informational purposes only. Consult with your
                    healthcare
                    provider for a detailed interpretation of your blood test results.</small></p>
        </div>

        <button id="saveButton" class="bg-purple-600 w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Save</button>

        <br />
    </div>

    <script>
        document.getElementById("saveButton").addEventListener("click", function() {
            
            var result1 = document.getElementById("result1").value;
            var result2 = document.getElementById("result2").value;
            var result3 = document.getElementById("result3").value;
            var result4 = document.getElementById("result4").value;

            var comment = document.getElementById("comment").value;
            var technician = document.getElementById("technician").value;
            var doctor = document.getElementById("doctor").value;
    
            // Validate resukts, comment, technician, and doctor
            if (result1 === "") {
                alert("Please enter results for all tests");
                return;
            }else if (result2 === "") {
                alert("Please enter results for all tests");
                return;
            }else if (result3 === "") {
                alert("Please enter results for all tests");
                return;
            }else if (result4 === "") {
                alert("Please enter results for all tests");
                return;
            }if (comment.trim() === "") {
                alert("Please enter a comment.");
                return;
            }else if (comment.trim().length > 350) {
                alert("Comment length must be lower that 350 digits");
                return;
            }else if (technician === "") {
                alert("Please select a technician");
                return;
            }else if(doctor === ""){
                alert("Please select a doctor.");
                return;
            }
    
            // Construct the request body
            var requestBody = {
                result1: result1,
                result2: result2,
                result3: result3,
                result4: result4,
                comment: comment.trim(),
                technicianId: technician,
                doctorId: doctor
            };
    
            // Send the POST request
            fetch("/reports/<%= appointment%>", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(requestBody)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                if(data.id!=null){
                    alert("Report Added Successfully.")
                    console.log("Success:", data);
                }
            })
            .catch(error => {
                alert("Error:"+error)
                console.error("Error:", error);
                // Handle error
            });
        });
    </script>
    
</body>

</html>