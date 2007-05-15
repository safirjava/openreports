<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@page import="org.efs.openreports.util.DisplayProperty"%>
<%@page import="org.efs.openreports.objects.Report"%>

<s:include value="Banner.jsp" />

<a class="back-link img-report-small" href="reportList.action">Back to Reports</a>
<a class="back-link img-group-small" href="reportGroup.action">Back to Groups</a>  	
  
<s:actionerror/>
  
<br/>

<div align="center">
	
  <div class="important img-queryreport" id="instructions"><s:property value="report.name"/></div>     
    
  <s:set name="results" value="results" scope="request" />  
  <s:set name="properties" value="properties" scope="request" />
  <s:set name="report" value="report" scope="request" />
  
  <% DisplayProperty[] displayProperties = (DisplayProperty[]) request.getAttribute("properties");
  	 Report report = (Report) request.getAttribute("report");%>
  
  <display:table name="results" class="displayTag" sort="list" export="true" pagesize="20" requestURI="queryReportResult.action">  
    <% for (int i=0; i < displayProperties.length; i++) { %>
      <display:column property="<%=displayProperties[i].getName()%>" title="<%=displayProperties[i].getDisplayName()%>" sortable="true" headerClass="sortable" />
    <% } %>
    <display:setProperty name="export.pdf" value="true"/>
	<display:setProperty name="export.xml" value="false"/>
	<display:setProperty name="export.pdf.filename" value="<%=report.getName() + ".pdf"%>"/>
	<display:setProperty name="export.csv.filename" value="<%=report.getName() + ".csv"%>"/>
	<display:setProperty name="export.excel.filename" value="<%=report.getName() + ".xls"%>"/>	  
  </display:table>


  <s:if test="#session.user.scheduler">
  
    Schedule Report: 
    <a href="reportOptions.action?reportId=<%=report.getId()%>&submitSchedule=true&exportType=3">CSV</a> |
    <a href="reportOptions.action?reportId=<%=report.getId()%>&submitSchedule=true&exportType=1">Excel</a> |
    <a href="reportOptions.action?reportId=<%=report.getId()%>&submitSchedule=true&exportType=0">PDF</a>
  
  </s:if>  

</div>

<s:include value="Footer.jsp" />



	