import projects from "./projects.json"
import "./project-item.imba"
import "./dialog-info.imba"

global css @root
	$viewport:80vw

global css 
	body c:warm2 bg:warm8 ff:sans fs:1.5rem inset:0 mx:auto my:2rem w:$viewport w@!840:90%
	h1, h2 w:$viewport w@!840:100% d:hcc bdy:.2rem solid purple8 py:1rem
	span, a c:yellow4 c@hover:yellow1
	a cursor@hover:pointer
	ul pl:1.5rem
	li list-style:none content@before:"✓ " c@before:yellow4

tag app
	show\boolean = no
	info\any = { name: "", done: no, url: "", description: "", color: "" }

	def toggle_modal e
		show = e.detail.show
		info = e.detail.data

	<self>
		<h1>
			<img[s:4rem pr:.5rem] src="https://imba.io/logo.svg" alt="logo-imba">
			"100 days of Imba"
		<p> "Webpage & Indexer of {<span> "#100DaysOfImba"} where you can find all projects made with {<a href="https://imba.io" target="_blank"> "Imba"}." 
		<h2> "Conditions"
		<p> "Each project:"
		<ul>
			<li> "{<b [tt:uppercase]> "must"} be developed on at least two consecutive days (recommended on weekends)."
			<li> "{<b [tt:uppercase]> "must"} be JAMStack (Javascript + API + Markup) using {<a href="https://imba.io" target="_blank"> "Imba"}."
			<li> "{<b [tt:uppercase]> "must"} have its own repository on Github, under the same organization."
			<li> "{<b [tt:uppercase]> "must"} have it's own URL under the root URL organization."
			<li> "{<b [tt:uppercase]> "can"} use LocalStorage as local database (if applicable)."
			<li> "{<b [tt:uppercase]> "can"} use any form of external or distributed storage (if applicable)."
			<li> "{<b [tt:uppercase]> "should"} be documented with a README.md file, explaining what they need for its operation and what was learned during the process."
		<h2> "Projects suggested"
		<div [d:grid gtc:4 gtc@!840:2 gtc@!420:1 gap:1rem]> for project in projects
			<project-item data=project @openDialog=toggle_modal>
		<h2> "Additional commitments"
		<ul>
			<li> "Each project completed should be shared, on social media, promoting both hashtags {<span> "#100DaysOfCode"} and {<span> "#100DaysOfImba"}, with a brief summary of what was learned."
			<li> "Each project should be ended within the time suggested. Consider how much hours do you need each day to reach the goal."
			<li> "All images in each project should be uploaded on SVG format (except favicons)."
			<li> "Each project can include any CSS Framework you consider, in order to speed your process, but {<a href="https://imba.io" target="_blank"> "Imba"} has it's own CSS engine, which is recommended ;)"
			<li> "All projects can be developed using Flat Design, Material Design, or whatever UI pattern design you want, but you must be consistent in which pattern design you choose. I mean, if the first project you completed (whatever it was) you made it on a Material Design, you should complete all remaining projects in that UI pattern design."
		<p> "Good luck and May the force be with you! 😌"
		<%meme [w:100% py:1rem bdy:.2rem solid purple8 d:vcc mb:2rem]>
			<img src="https://media.giphy.com/media/GcSqyYa2aF8dy/giphy.gif" alt="just-do-it">
		<a [w:100% d:vcc pb:2rem td:none fs:1rem] href="https://elaguacate.dev" target="_blank"> "Lo leíste de un aguacate🥑"
		if show
			<dialog-info data=info show_dialog=show @closeDialog=toggle_modal>
		
imba.mount <app>