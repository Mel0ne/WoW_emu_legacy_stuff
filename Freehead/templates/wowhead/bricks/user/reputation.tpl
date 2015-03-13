{if $user}
<div id="tabs_contribute-generic" style="width: 50%"></div>
<div class="text" style="margin-right: 310px">
	<div class="tabbed-contents" style="clear: none">
		<div id="tab-reputation-history" style="display: none">
		<table width="100%">
		<th width="60%">{#Reputation_action#}</th>
		<th width="15%" align="left">{#Reputation_amount#}</th>
		<th width="25%" align="left">{#Reputation_date#}</th>
		{foreach from=$user.reputation item="row"}
		<tr><td width="60%">
		{if $row.reason ==1}
		Registering an account
		{elseif $row.reason ==2}
		Daily visit
		{elseif $row.reason ==3}
		Posting a comment
		{elseif $row.reason ==4}
		Your comment was voted up (each upvote)
		{elseif $row.reason ==5}
		Submitting a screenshot
		{elseif $row.reason ==6}
		Submitting a guide (approved)
		{elseif $row.reason ==7}
		Earning a <font color="brown">Copper</font> <a href="/?website-achievements">website achievement</a>
		{elseif $row.reason ==8}
		Earning a Silver <a href="/?website-achievements">website achievement</a>
		{elseif $row.reason ==9}
		Earning a <font color="gold">Gold</font> <a href="/?website-achievements">website achievement</a>
		{/if}
		</td><td width="15%"><font color="green">+{$row.reputation}</font></td><td width="25%"> {$row.date}</td></tr>
		{/foreach}
		</table>
		</div>
		

<div id="tab-characters" style="display: none">

<table width="100%">
<th>{#Characters_name#}</th>
<th>{#Characters_faction#}</th>
<th>{#Characters_race#}</th>
<th>{#Characters_class#}</th>
<th>{#Characters_level#}</th>
<th>{#Characters_ping#}</th>
<th>{#Characters_status#}</th>
{foreach from=$user.characters item="char"}
<tr><td align="center">{$char.name}</td><td align="center">
{if $char.race == 1 || 3 || 4 || 7 || 11}
{#Alliance#}
{else}
{#Horde#}
{/if}
</td><td align="center">
{if $char.race == 1}
{#Human#}
{elseif $char.race == 2}
{#Orc#}
{elseif $char.race == 3}
{#Dwarf#}
{elseif $char.race == 4}
{#Night_elf#}
{elseif $char.race == 5}
{#Undead#}
{elseif $char.race == 6}
{#Tauren#}
{elseif $char.race == 7}
{#Gnome#}
{elseif $char.race == 8}
{#Troll#}
{elseif $char.race == 9}
{#Goblin#}
{elseif $char.race == 10}
{#Blood_elf#}
{elseif $char.race == 11}
{#Draenei#}
{/if}
</td><td align="center">
{if $char.class ==1}
{#Warrior#}
{elseif $char.class==2}
{#Paladin#}
{elseif $char.class==3}
{#Hunter#}
{elseif $char.class==4}
{#Rogue#}
{elseif $char.class==5}
{#Priest#}
{elseif $char.class==6}
{#Death_Knight#}
{elseif $char.class==7}
{#Shaman#}
{elseif $char.class==8}
{#Mage#}
{elseif $char.class==9}
{#Warlock#}
{elseif $char.class==11}
{#Druid#}
{/if}
</td><td align="center">{$char.level}</td><td align="center">{$char.latency} ms</td><td align="center">{if $char.online == 0}<font color="red">Offline</font>{else}<font color="green">Online</font>{/if}</td></tr>
{/foreach}
</table>
		</div>



	</div>
</div>
<script type="text/javascript">
	var tabsContribute = new Tabs({ldelim}parent: ge('tabs_contribute-generic'){rdelim});
	tabsContribute.add(LANG.tab_reputation, {ldelim}id: 'reputation-history'{rdelim});
	tabsContribute.add(LANG.tab_characters, {ldelim}id: 'characters'{rdelim});
	tabsContribute.flush();
</script>

<div class="clear"></div>
{else}
{/if}