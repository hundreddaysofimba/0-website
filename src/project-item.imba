tag project-item
	<self
		[bd:.2rem solid purple8 p:1rem rd:xl] 
		[cursor@hover:pointer bd:.2rem solid yellow4 transform@hover:scale(1.1) ease:.5s]=data.done
		@click.if(data.done)=(emit("openDialog", {data, show: yes}))
	> data.name