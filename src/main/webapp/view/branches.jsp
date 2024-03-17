<!DOCTYPE html>
<%@page import="com.kavisoft.web.abclaboratories.model.Branch"%>
<%@page import="com.kavisoft.web.abclaboratories.model.Doctor"%>
<%@page import="com.kavisoft.web.abclaboratories.model.Technician"%>
<%@page import="com.kavisoft.web.abclaboratories.model.User"%>
<%@page import="com.kavisoft.web.abclaboratories.dto.AllAppointmentsDTO" %>
  <%@page import="java.util.ArrayList" %>
    <%@page import="java.util.List" %>
      <html lang="en">

      <body>
        <%@ include file="dashboard_header.jsp" %>
          <!-- <div class="w-full "></div> -->

          <div class="mt-28 mb-4">
            <h1 class="tile text-2xl">Branches</h1>
        </div>

          <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
              <thead class="text-xs text-gray-700 uppercase dark:text-gray-400">
                <tr>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    ID
                  </th>
                  <th scope="col" class="px-6 py-3">
                    Name
                  </th>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    Telephone   
                  </th>                                   
                  <th scope="col" class="px-6 py-3">
                    Address
                  </th>
                  <th scope="col" class="px-6 py-3 bg-gray-50 dark:bg-gray-800">
                    Update   
                  </th> 
                </tr>
              </thead>
              <tbody>
           <% // Access the list of appointments from the model
																		List<Branch> branches = (List<Branch>) request.getAttribute("branches");
																			
																			for (Branch branch : branches) {
																			%>

                <tr class="border-b border-gray-200 dark:border-gray-700">
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <%=branch.getId() %>
                  </td>
                  <td class="px-6 py-4">
                    <%=branch.getCity() %>
                  </td>
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <%=branch.getTelephone() %>
                  </td>                 
                  <td class="px-6 py-4">
                    <%=branch.getAddress() %>                 
                  </td>
                  <td class="px-6 py-4 bg-gray-50 dark:bg-gray-800">
                    <a href="#>" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Update</a>
                  </td> 
                </tr>
                <% } %>

              </tbody>
            </table>
          </div>
      </body>

      </html>