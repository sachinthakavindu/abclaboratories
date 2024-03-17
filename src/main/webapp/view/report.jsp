<!DOCTYPE html>
<%@page import="com.kavisoft.web.abclaboratories.dto.ReportDTO"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Report</title>
    <!-- Replace Bulma with Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <!-- <script src="https://cdn.tailwindcss.com"></script> -->

    <!-- Include html2canvas library via CDN -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script> -->

    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
 -->
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
    <div class="container" id="content">
    <% 
    ReportDTO dto=(ReportDTO) request.getAttribute("data");
    
      	int type = dto.getTypeId();
        int appointment = dto.getAppointmentId();
        
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
        
        double result1=dto.getResult1();
        double result2=dto.getResult2();
        double result3=dto.getResult3();
        double result4=dto.getResult4();
        
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

        <h1 class="text-2xl text-center">Blood Test Medical Report</h1>
        <br />
        <h2 class="text-lg">Patient Information</h2>
        <p><strong>Patient Name:</strong> <%=dto.getName() %></p>
        <p><strong>Date of Birth:</strong> <%=dto.getDob() %></p>
        <p><strong>Gender:</strong> <%=dto.getGender() %></p>
        <p><strong>Contact Number:</strong> <%=dto.getGender() %></p>

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
                    <td class="px-4 py-2"> <%=result1+" "+unit1 %></td>
                    <td class="px-4 py-2"><%=ref1 %></td>
                </tr>
                <tr>
                    <td class="px-4 py-2"><%=test2 %></td>
                    <td class="px-4 py-2"> <%=result1+" "+unit1 %></td>
                    <td class="px-4 py-2"><%=ref2 %></td>
                </tr>
                <tr>
                    <td class="px-4 py-2"><%=test3 %></td>
                    <td class="px-4 py-2"> <%=result1+" "+unit1 %></td>
                    <td class="px-4 py-2"><%=ref3 %></td>
                </tr>
                <tr>
                    <td class="px-4 py-2"><%=test4 %></td>
                    <td class="px-4 py-2"> <%=result1+" "+unit1 %></td>
                    <td class="px-4 py-2"><%=ref4 %></td>
                </tr>
                <!-- Add more rows for additional test results -->
            </tbody>
        </table>

        <h2 class="text-lg">Doctor's Comments</h2>
        <p class="leading-6"><%=dto.getComment() %></p>
        <br />
        <div class="flex justify-between">
            <div class="w-1/2 flex items-center">
                <span>Technician:&nbsp;&nbsp;</span>
                <span><%=dto.getTechnician() %></span>
            </div>

            <div class="w-1/2 flex items-center">
                <span>Doctor:&nbsp;&nbsp;</span>
                <span><%=dto.getDoctor() %></span>
            </div>
        </div>
        <br />
        <div class="content">
            <p><strong>Note:</strong> <small>This report is for informational purposes only. Consult with your
                    healthcare
                    provider for a detailed interpretation of your blood test results.</small></p>
        </div>

        <br />
    </div>

    <div class="flex justify-center">
        <button onclick="saveAsPDF()" class="bg-purple-600 w-1/2 text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Download</button>
    </div>

        <!-- Include the html2pdf library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

<script>
    function saveAsPDF() {

        var docName="<%=testName%> Medical Report - <%=dto.getName()%>";

        // Define options for html2pdf
        const options = {
            filename: docName+".pdf", // Name of the PDF file
            image: { type: 'jpeg', quality: 0.98 }, // Image type and quality
            html2canvas: { scale: 2 }, // Scale factor for html2canvas
            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' } // PDF format and orientation
        };

        // Select the specific div and its content
        const contentElement = document.getElementById('content');

        // Use html2pdf to generate the PDF
        html2pdf()
            .from(contentElement)
            .set(options)
            .save();
    }
</script>
        
</body>

</html>