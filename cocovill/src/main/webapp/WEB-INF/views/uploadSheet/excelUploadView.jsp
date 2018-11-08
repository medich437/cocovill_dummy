<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/taglibs.jsp"%>


<div class="col-lg-12">

	<table id="dataTable" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th class="col-lg-1">A</th>
				<th class="col-lg-1">B</th>
				<th class="col-lg-1">C</th>
				<th class="col-lg-1">D</th>
				<th class="col-lg-1">E</th>
				<th class="col-lg-1">F</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty resultList }">
					<tr><td colspan="6">등록된 내용이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${resultList }" var="result">
						<tr>
							<td>${result.A }</td>
							<td>${result.B }</td>
							<td>${result.C }</td>
							<td>${result.D }</td>
							<td>${result.E }</td>
							<td>${result.F }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
</div>
