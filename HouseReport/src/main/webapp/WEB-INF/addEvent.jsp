<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Event</title>
</head>
<body>
<h2>Add event for: </h2>
<p>${listing.address.street}</p>
<p>${listing.address.city}, ${listing.address.state} ${listing.address.postalCode}</p>
<form action="addEvent.do" method="post">
<label>Event: </label>
<select name="eventType">
	<option value="Earthquake">Earthquake</option>
	<option value="Hurricane">Hurricane</option>
	<option value="Wildfire">Wildfire</option>
	<option value="Tornado">Tornado</option>
	<option value="Tsunami">Tsunami</option>
	<option value="Flood">Flood</option>
	<option value="Hail">Hail</option>
</select><br>
<label>Event date:</label>
<input type="date" name="eventDate"
	value="2021-04-17"
	min="1950-01-01" max="2021-07-23">
	<input type="hidden" value="${listing.id}">
</form>

</body>
</html>