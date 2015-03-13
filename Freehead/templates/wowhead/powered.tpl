{include file='header.tpl'}

		<div id="main">
			<div id="main-precontents"></div>
			<div id="main-contents" class="main-contents">
			<b><font size="4px">{#Tooltips#}</font></b>
			<hr>
			<br>
			{#Tooltips_desk_1#}
			<br>
			<ul>
			<ol><li>{#Tooltips_opt_1#}<br>
			<div id="powered" class="listview"><textarea cols="100" rows="1" readonly="readonly"><script type="text/javascript" src="http://{php}$addr = $_SERVER['SERVER_NAME']; echo $addr;{/php}/templates/wowhead/js/power.js"></script></textarea></div></li><br>
			<li>{#Tooltips_opt_2#}</li></ol>
			</ul>
			<br>
			{#Tooltips_desk_2#}
			<br><br><hr>
			<b><font size="3px">{#Tooltips_cat_general#}</font></b><hr>
			<ul>
				<li><b>{#Tooltips_howto_1#}</b></br>
				{#Tooltips_howto_2#}<br>
				<div id="powered" class="listview"><textarea cols="100" rows="1" readonly="readonly"><a href="#" rel="item=2828">hai</a></textarea></div><br>
				{#Tooltips_howto_3#}</li>
			</ul>
			<br><br><hr>
			<b><font size="3px">{#Tooltips_example#}</font></b><hr><br>
			{#Tooltips_desk_3#}<br><br>
			<b>{#Tooltips_example_1#}:</b> <a href="#" rel="item=49623">{#Tooltips_example_item#}</a><br>
			<b>{#Tooltips_example_2#}:</b> <a href="#" rel="quest=24549">{#Tooltips_example_quest#}</a><br>
			<b>{#Tooltips_example_3#}:</b> <a href="#" rel="achievement=4623">{#Tooltips_example_achievement#}</a><br>
			
				<div class="clear"></div>
			</div>
		</div>

{include file='footer.tpl'}