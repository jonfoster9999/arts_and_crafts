	// $.get('/projects', function(response){
	// 	var currentId = response["current_id"]
	// 	var projects = response["projects"]
	// 	var list = ""
	// 	$.each(projects, function(index, project){
	// 		//I am going to instantiate a new object right here and use methods to
	// 		//truncate description and build the link

	// 	var listItem = '<li class="project_list_item">'
	// 	listItem += '<img src="<%= asset_path( 'scissors.png' ) %>" />'
	// 	listItem += '<h3><a href="/users/' + project.user_id + '/projects/' + project.id + '">'
	// 	listItem += project.title + '</a>'
	// 	if (currentId == project.user_id) {
	// 		listItem += '<span class="green">My Project!</span>'
	// 	}
	// 	console.log(project)
	// 	listItem += "</h3>"
	// 	listItem += "<p><em>" + project.description + "</p></em>"
	// 	listItem += '</li>'

	// 	list += listItem
	// 	})
	// 	$('.mainlist').append(list)
	// })