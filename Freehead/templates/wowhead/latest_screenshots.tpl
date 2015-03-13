{include file='header.tpl'}

<div id="main">
	<div id="main-precontents"></div>
	<div id="main-contents" class="main-contents">
		<script type="text/javascript">
			g_initPath({$page.path})
		</script>
		<div class="text">
			<div class="h1-links"></div>
			<h1>{#Latest_Screenshots#}</h1>
		</div>
		<div id="lv-screenshots" class="listview"></div>
		<script type="text/javascript">
			{strip}
			new Listview({ldelim}template: 'screenshot', id: 'screenshots', data: [
			{foreach name=foo from=$screenshots key=number item=screenshot}
				{ldelim}
					number:{$screenshot.number},
					user:'{$screenshot.user}',
					date:'{$screenshot.date|date_format:"%Y/%m/%d %H:%M:%S"}',
					body:'{$screenshot.body}',
					subject:'{$screenshot.subject|escape:"javascript"}',
					width:{$screenshot.width},
					height:{$screenshot.height},
					type:{$screenshot.type},
					typeId:{$screenshot.typeId},
					id:{$screenshot.id}
				{rdelim}
				{if $smarty.foreach.foo.last}{else},{/if}
			{/foreach}
			]{rdelim});
			{/strip}
		</script>
		<div class="clear"></div>
	</div>
</div>

{include file='footer.tpl'}