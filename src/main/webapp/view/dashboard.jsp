<!DOCTYPE html>
<%@page import="com.kavisoft.web.abclaboratories.dto.AllAppointmentsDTO" %>
  <%@page import="java.util.ArrayList" %>
    <%@page import="java.util.List" %>
      <html lang="en">

      <body>
        <%@ include file="dashboard_header.jsp" %>
          <!-- <div class="w-full "></div> -->

          <div class="mt-28 mb-4">
            <h1 class="tile text-2xl">Appointments</h1>
        </div>

          <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
              <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                <tr>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    ID
                  </th>
                  <th scope="col" class="px-6 py-3">
                    Test Type
                  </th>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    Branch
                  </th>
                  <th scope="col" class="px-6 py-3">
                    Patient ID
                  </th>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    Full Name
                  </th>
                  <th scope="col" class="px-6 py-3">
                    Report
                  </th>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    Date
                  </th>
                  <th scope="col" class="px-6 py-3">
                    Time
                  </th>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    Add Report
                  </th>
                </tr>
              </thead>
              <tbody>
           <% // Access the list of appointments from the model
																		ArrayList<AllAppointmentsDTO> appointments = (ArrayList<AllAppointmentsDTO>) request.getAttribute("appointments");
																			
																			for (AllAppointmentsDTO appointment : appointments) {
																			%>

                <tr class="border-b border-gray-200 dark:border-gray-700">
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <%=appointment.getId() %>
                  </td>
                  <td class="px-6 py-4">
                    <%=appointment.getType() %>
                  </td>
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <%=appointment.getCity() %>
                  </td>
                  <td class="px-6 py-4">
                    <%=appointment.getPatientId() %>
                  </td>
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <%=appointment.getFirstName() +" "+appointment.getLastName() %>
                  </td>
                  <td class="px-6 py-4">
                    <%=appointment.getReportId() %>
                  </td>
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <%=appointment.getDate() %>
                  </td>
                  <td class="px-6 py-4">
                    <%=appointment.getTime() %>
                  </td>
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <a href="/reports/<%=appointment.getTypeId() %>/<%=appointment.getId() %>" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Update</a>
                  </td>
                </tr>
                <% } %>

              </tbody>
            </table>
          </div>
      </body>

      </html>