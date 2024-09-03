tag dialog-info
	prop show_dialog\boolean = no

	get project_url
		"https://hundreddaysofimba.github.io" + data.url

	get github_url
		"https://github.com/hundreddaysofimba" + data.url

	get color
		const response = {text: "", background: ""}
		let [denomination, tint] = data.color.split("-")
		response.background = denomination + tint
		let grade = if tint < 5 then "9" else "0"
		response.text = denomination + grade
		return response

	css button, a appearence:none bd:none rd:xl px:1rem py:.5rem cursor@hover:pointer td:none mx:1rem fs:1rem fw:bold

	<self [w:25rem p:2rem bd:.2rem solid {color.background} rd:xl bgc:{color.background}/80 pos:fixed t:50% l:50% transform:translate(-50%, -50%) d:vcc]>
		<h3> data.name
		<p> data.description
		<button [pos:absolute t:0 r:-.5rem bgc:transparent c:warm0 s:2rem] @click=emit("closeDialog", {data, show: no})> "X"
		<%inline [d:inline]>
			<a href=github_url target="_blank" [bgc:{color.background} c:{color.text} bd:black]> "Repository"
			<a href=project_url target="_blank" [bgc:{color.background} c:{color.text} bd:black]> "Preview"
			
		