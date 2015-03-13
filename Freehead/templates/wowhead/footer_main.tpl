	<div id="footer">
	</div>
	<noscript><div id="noscript-bg"></div><div id="noscript-text">{#js_err#}</div></noscript>
	<script type="text/javascript">DomContentLoaded.now()</script>
	
	<center>{if $AOWOW_REVISION != $AOWOW_LATEST_REVISION}{#Update_availible#} {$AOWOW_LATEST_REVISION}<br>
	{#Current_version#} {$AOWOW_REVISION}{else}{/if}</center>
	
	<center><font size="2px"> <a href="/">{#Footer_about#}</a> |  <a href="/">{#Footer_faq#}</a> |  <a href="/">{#Footer_press#}</a> |  <a href="/">{#Footer_privacy#}</a> |  <a href="/">{#Footer_terms#}</a></font></center><br>
	<center><font color="grey"><small>&copy; 2013 FreedomHead </small></font></center>
</body>
</html>