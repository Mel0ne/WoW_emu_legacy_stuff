{include file='header.tpl'}

		<div id="main">

			<div id="main-precontents"></div>

			<div id="main-contents" class="main-contents">
				<script type="text/javascript">
					{include file='bricks/allcomments.tpl'}
					{include file='bricks/allscreenshots.tpl'}
					var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$itemset.name|escape:"quotes"}'{rdelim};
					g_initPath({$page.path});
				</script>
				<table class="infobox">
					<tr><th>{#Quick_Facts#}</th></tr>
					<tr><td>
						<div class="infobox-spacer"></div>
						<ul>
							{if isset($faction.group)}<li><div>{#Group#}: {$faction.group}</div></li>{/if}
							{if isset($faction.side)}<li><div>{#Side#}: {if $faction.side==1}<span class="alliance-icon">{#Alliance#}</span>{elseif $faction.side==2}<span class="horde-icon">{#Horde#}</span>{/if}</div></li>{/if}
						</ul>
					</td></tr>
				</table>
				<div class="text">
					<h1>{$faction.name}</h1>
					{$faction.description1}
					{if $faction.description1}<h1></h1>{/if}
					{$faction.description2}
					
				<h2>{#Related#}</h2>
				</div>
				<div id="tabs-generic"></div>
				<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($faction.quests)}{include			file='bricks/quest_table.tpl'		id='quests'			name='quests'		tabsid='tabsRelated'	data=$faction.quests		}{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: lv_comments{rdelim});
new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});
tabsRelated.flush();
</script>
				{include file='bricks/contribute.tpl'}

				</div>
			</div>
		</div>
{include file='footer.tpl'}