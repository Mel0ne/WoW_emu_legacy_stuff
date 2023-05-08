{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			<script type="text/javascript">
				{include file='bricks/allcomments.tpl'}
				{include file='bricks/allscreenshots.tpl'}
				var g_pageInfo = {ldelim}type: 1, typeId: {$npc.entry}, name: '{$npc.name|escape:"quotes"}'{rdelim};
				g_initPath([0,4,{$npc.type}]);
			</script>

			<table class="infobox">
				<tr><th>{#Quick_Facts#}</th></tr>
				<tr><td><div class="infobox-spacer"></div>
					<ul>
						<li><div>{#Level#}: {if $npc.minlevel<>$npc.maxlevel}{$npc.minlevel} - {/if}{$npc.maxlevel}</div></li>
						<li><div>{#Classification#}: {if $npc.dtype == 3}<img src="/images/boss_icon.png"> {$npc.rank}{else}{$npc.rank}{/if}</div></li>
						<li><div>{#React#}: <span class="q{if $npc.A==-1}10{elseif $npc.A==1}2{else}{/if}">A</span> <span class="q{if $npc.H==-1}10{elseif $npc.H==1}2{else}{/if}">H</span></div></li>
						<li><div>{#Faction#}: <a href="?faction={$npc.faction_num}">{$npc.faction}</a></div></li>
						<li><div>{#Health#}: 
						{if $npc.heroic.type == 1}
						<span class="tip" id="infobox-details"
							onmouseover="Tooltip.showAtCursor(event, 'Heroic 10ppl:  {$npc.10pplh}<br>Heroic 25ppl: {$npc.25pplh}', 0, 0, 0)"
							onmousemove="Tooltip.cursorUpdate(event)"
							onmouseout="Tooltip.hide()">{$npc.minhealth}</span></div></li>
						{else}
						<span class="tip" id="infobox-details"
							onmouseover="Tooltip.showAtCursor(event, 'Normal 10ppl:  {$npc.minhealth}<br>Normal 25ppl: {$npc.25ppln}', 0, 0, 0)"
							onmousemove="Tooltip.cursorUpdate(event)"
							onmouseout="Tooltip.hide()">{$npc.minhealth}</span></div></li>
						{/if}
{if ($npc.minmana or $npc.maxmana)}
						<li><div>{#Mana#}: {if $npc.minmana<>$npc.maxmana}{$npc.minmana} - {/if}{$npc.maxmana}</div></li>
{/if}
{if ($npc.moneysilver>0) or ($npc.moneygold>0) or ($npc.moneycopper>0)}
						<li><div>{#Wealth#}:{if ($npc.moneygold>0)}
 <span class="moneygold">{$npc.moneygold}</span>{/if}
{if ($npc.moneysilver>0)}
 <span class="moneysilver">{$npc.moneysilver}</span>{/if}
{if ($npc.moneycopper>0)}
 <span class="moneycopper">{$npc.moneycopper}</span>{/if}
</div></li>
{/if}
{if $npc.mindmg > 0 and $npc.maxdmg > 0}
						<li><div>{#Damage#}: {$npc.mindmg} - {$npc.maxdmg}</div></li>
{/if} 
{if $npc.armor > 0}
						<li><div>{#Armor#}: {$npc.armor}</div></li>
{/if} 
<tr><th id="infobox-">{#Screenshots_tab#}</th></tr>
<tr><td><div class="infobox-spacer"></div><center><div id="infobox-sticky-ss"></div></center></td></tr>
					</ul>
				</td></tr>
			</table>

			<div class="text">
				<a href="http://www.wowhead.com/?{$query}" class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>
				<a href="javascript:;" id="dsgndslgn464d" class="button-red" onclick="this.blur(); ModelViewer.show({ldelim} type: {$page.type}, typeId: {$npc.entry}, displayId: {$npc.model}{rdelim})"><em><b><i>{#Viewer_3D#}</i></b><span>{#Viewer_3D#}</span></em></a>
				<h1>{$npc.name}{if $npc.subname} &lt;{$npc.subname}&gt;{/if}</h1>
			

{if $npc.heroic}
				<div>{if $npc.heroic.type == 1}{#This_is_heroic_NPC#}{else}{#This_is_normal_NPC#}{/if} <a href="?npc={$npc.heroic.entry}">{$npc.heroic.name}</a>.</div>
				<div class="pad"></div>
{/if}

{if $npc.position}
				<div>{#This_NPC_can_be_found_in#} {strip}<span id="locations">
					{foreach from=$npc.position item=zone name=zone}
						<a href="javascript:;" onclick="
						{if $zone.atid}
							myMapper.update(
								{ldelim}
									zone:{$zone.atid}
									{if $zone.points}
										,
									{/if}
								{if $zone.points}
									coords:[
										{foreach from=$zone.points item=point name=point}
												[{$point.x},{$point.y},
												{ldelim}
													label:'$<br>
													<div class=q0>
														<small>
															{if isset($point.r)}
																{#Respawn#}:
																{if isset($point.r.h)} {$point.r.h}{#hr#}{/if}
																{if isset($point.r.m)} {$point.r.m}{#min#}{/if}
																{if isset($point.r.s)} {$point.r.s}{#sec#}{/if}
															{else}
																{#Waypoint#}
															{/if}
															{if isset($point.events)}<br>{$point.events|escape:"quotes"}{/if}
														</small>
													</div>',type:'{$point.type}'
												{rdelim}]
												{if !$smarty.foreach.point.last},{/if}
										{/foreach}
									]
								{/if}
								{rdelim});
							ge('mapper-generic').style.display='block';
						{else}
							ge('mapper-generic').style.display='none';
						{/if}
								g_setSelectedLink(this, 'mapper'); return false" onmousedown="return false">
							{$zone.name}</a>{if $zone.population > 1}&nbsp;({$zone.population}){/if}{if $smarty.foreach.zone.last}.{else}, {/if}
					{/foreach}
				</span></div>
{/strip}
				<div id="mapper-generic"></div>
				<div class="clear"></div>

				<script type="text/javascript">
					var myMapper = new Mapper({ldelim}parent: 'mapper-generic', zone: '{$npc.position[0].atid}'{rdelim});
					gE(ge('locations'), 'a')[0].onclick();
				</script>
{else}
				{#This_NPC_cant_be_found#}
{/if}
<br>
{if $npc.quotes_count > 0}
<a class="disclosure-off" id="show_id" onclick="document.getElementById('spoiler_id').style.display=''; document.getElementById('show_id').style.display='none';" class="link">
{#Quotes#} ({$npc.quotes_count})</a>
<span id="spoiler_id" style="display: none">
<a class="disclosure-on" id="show_id" onclick="document.getElementById('spoiler_id').style.display='none'; document.getElementById('show_id').style.display='';" class="link">
{#Quotes#} ({$npc.quotes_count})</a><br>
{/if}
{foreach from=$npc.quotes item="row"}
{if $row.type == 12}
<ul><li><font color='white'>{$npc.name}{$npc.subname} say: {$row.text}<br/> </font></li></ul>
{/if}
{if $row.type == 14}
<ul><li><font color='red'>{$npc.name}{$npc.subname} yells: {$row.text}<br/> </font></li></ul>
{/if}
{if $row.type == 15}
<ul><li><font color='#FFB2EB'>{$npc.name}{$npc.subname} whispers: {$row.text}<br/></font></li></ul>
{/if}
{if $row.type == 16}
<ul><li><font color='white'>{$npc.name}{$npc.subname} yells: {$row.text}<br/> </font></li></ul>
{/if}
{if $row.type == 41}
<ul><li><font color='yellow'>{$npc.name}{$npc.subname} {$row.text}<br/> </font></li></ul>
{/if}
{if $row.type == 42}
<ul><li><font color='red'>{$npc.name}{$npc.subname} say: {$row.text}<br/> </font></li></ul>
{/if}
{/foreach}
</span>

					<h3>{#Rewards#}</h3>
{if isset($npc.reprewards)}
{section name=j loop=$npc.reprewards}
						<li><div>{$npc.reprewards[j].value} {#reputationwith#} <a href="?faction={$npc.reprewards[j].entry}">{$npc.reprewards[j].name}</a></div></li>
{/section}
{/if}	
{if isset($npc.onkillrep)}
{#Onkill_rep#}
{foreach from=$npc.killrep item=onkill}
{if $npc.dtype == 3}
<ul>
	<li>
		<span class="rep-difficulty">Normal</span>
	</li>
<ul>
	<li>
		<div>
			<span>{$onkill.value}</span> {#reputationwith#} <a href="/faction={$onkill.entry}">{$onkill.name}</a>
		</div>
	</li>
</ul>
</ul>
<ul>
	<li>
		<span class="rep-difficulty">Heroic</span>
	</li>
<ul>
	<li>
		<div>
			<span>{$onkill.value*2}</span> {#reputationwith#} <a href="/faction={$onkill.entry}">{$onkill.name}</a>
		</div>
	</li>
</ul>
</ul>
{elseif $onkill.value < 0}
<li><div><font color="red"><strong>{$onkill.value}</strong></font> {#reputationwith#} <a href="?faction={$onkill.entry}" rel="faction={$onkill.entry}">{$onkill.name}</a></div></li>
{elseif $onkill.value > 0}
<li><div><font color="green"><strong>+{$onkill.value}</strong></font>  {#reputationwith#} <a href="?faction={$onkill.entry}" rel="faction={$onkill.entry}">{$onkill.name}</a></div></li>
{/if}
{/foreach}
{/if}

				<h2>{#Related#}</h2>

			</div>

			<div id="tabs-generic"></div>

			<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($npc.sells)}{include 			file='bricks/item_table.tpl'			id='sells'				name='sells'			tabsid='tabsRelated' data=$npc.sells			}{/if}
{if isset($npc.drop)}{include 			file='bricks/item_table.tpl'			id='drop'				name='drops'			tabsid='tabsRelated' data=$npc.drop				}{/if}
{if isset($npc.pickpocketing)}{include	file='bricks/item_table.tpl'			id='pick-pocketing'		name='pickpocketing'	tabsid='tabsRelated' data=$npc.pickpocketing	}{/if}
{if isset($npc.skinning)}{include		file='bricks/item_table.tpl'			id='skinning'			name='skinning'			tabsid='tabsRelated' data=$npc.skinning			}{/if}
{if isset($npc.starts)}{include			file='bricks/quest_table.tpl'			id='starts'				name='starts'			tabsid='tabsRelated' data=$npc.starts			}{/if}
{if isset($npc.ends)}{include			file='bricks/quest_table.tpl'			id='ends'				name='ends'				tabsid='tabsRelated' data=$npc.ends				}{/if}
{if isset($npc.abilities)}{include		file='bricks/spell_table.tpl'			id='abilities'			name='abilities'		tabsid='tabsRelated' data=$npc.abilities		}{/if}
{if isset($npc.objectiveof)}{include	file='bricks/quest_table.tpl'			id='objective-of'		name='objectiveof'		tabsid='tabsRelated' data=$npc.objectiveof		}{/if}
{if isset($npc.teaches)}{include		file='bricks/spell_table.tpl'			id='teaches-ability'	name='teaches'			tabsid='tabsRelated' data=$npc.teaches			}{/if}
{if isset($npc.criteria_of)}{include 	file='bricks/achievement_table.tpl' 	id='criteria-of'		name='criteriaof'		tabsid='tabsRelated' data=$npc.criteria_of		}{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: lv_comments{rdelim});
new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});
tabsRelated.flush();
ss_appendSticky();
</script>

			{include file='bricks/contribute.tpl'}

			<div class="clear"></div>
		</div>
	</div>

{include file='footer.tpl'}