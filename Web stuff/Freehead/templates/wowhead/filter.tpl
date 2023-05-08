<div id="fi">
    <div class="block-bg">
        <div id="ad-content">
        </div>
    </div>
        <script type="text/javascript">//<![CDATA[ 
    {literal}
    Menu.modifyUrl(
        Menu.findItem(mn_database, [0]), { filter: '+=si=-1' }, { onAppendCollision: fi_mergeFilterParams, onAppendEmpty: fi_setFilterParams, menuUrl: Menu.getItemUrl(Menu.findItem(mn_database, [0])) });
{/literal}
//]]></script>



<form action="" method="get" name="fi" onsubmit="return fi_submit(this)" onreset="return fi_reset(this)">
<input type="hidden" name="items" value="filter" />
<div class="rightpanel">
<div style="float: left">{#Quality#}: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['qu[]'].selectedIndex = -1; return false" onmousedown="return false">{#Clear_filter#}</a></small>
<div class="clear"></div>
<select name="qu[]" size="8" multiple="multiple" class="rightselect" style="background-color: #181818">
<option value="0" class="q0">{#Poor#}</option>
<option value="1" class="q1">{#Common#}</option>
<option value="2" class="q2">{#Uncommon#}</option>
<option value="3" class="q3">{#Rare#}</option>
<option value="4" class="q4">{#Epic#}</option>
<option value="5" class="q5">{#Legendary#}</option>
<option value="6" class="q6">{#Artifact#}</option>
<option value="7" class="q7">{#Heirloom#}</option>
</select>
</div>

<div class="rightpanel2">
<div style="float: left">{#Slot#}: </div><small><a href="javascript:;" onclick="document.forms['fi'].elements['sl[]'].selectedIndex = -1; return false" onmousedown="return false">{#Clear_filter#}</a></small>
<div class="clear"></div>
<select name="sl[]" size="7" multiple="multiple" class="rightselect">
<option value="16">{#Back#}</option>
<option value="18">{#Bag#}</option>
<option value="5">{#Chest#}</option>
<option value="8">{#Feet#}</option>
<option value="11">{#Finger#}</option>
<option value="10">{#Hands#}</option>
<option value="1">{#Head#}</option>
<option value="23">{#Held_in_off_hand#}</option>
<option value="7">{#Legs#}</option>
<option value="21">{#Main_hand#}</option>
<option value="2">{#Neck#}</option>
<option value="22">{#Off_hand#}</option>
<option value="13">{#One_hand#}</option>
<option value="24">{#Projectile#}</option>
<option value="15">{#Ranged#}</option>
<option value="28">{#Relic#}</option>
<option value="14">{#Shield#}</option>
<option value="4">{#Shirt#}</option>
<option value="3">{#Shoulder#}</option>
<option value="19">{#Tabard#}</option>
<option value="25">{#Thrown#}</option>
<option value="12">{#Trinket#}</option>
<option value="17">{#Two_hand#}</option>
<option value="6">{#Waist#}</option>
<option value="9">{#Wrist#}</option>
</select>
</div>

<table>
<tr>
<td>{#Item_name#}: </td>
<td colspan="2">&nbsp;<input type="text" name="na" size="30" /></td>
<td></td>
</tr><tr>
<td class="padded">{#Item_level#}: </td><td class="padded">&nbsp;<input type="text" name="minle" maxlength="3" class="smalltextbox2" /> - <input type="text" name="maxle" maxlength="3" class="smalltextbox2" /></td>
<td class="padded"><table><tr><td>{#Item_required_level#}: </td><td>&nbsp;<input type="text" name="minrl" maxlength="2" class="smalltextbox" /> - <input type="text" name="maxrl" maxlength="2" class="smalltextbox" /></td></tr></table></td><td></td>
</tr><tr><td class="padded">{#Usable_by#}: </td><td class="padded">&nbsp;<select name="si" style="margin-right: 0.5em">
<option></option>
<option value="1">{#Alliance#}</option>
<option value="-1">{#Alliance_only#}</option>
<option value="2">{#Horde#}</option>
<option value="-2">{#Horde_only#}</option>
<option value="3">{#Both#}</option>
</select>
</td>
<td class="padded"><select name="ub">
<option></option>
<option value="6">{#Death_Knight#}</option>
<option value="11">{#Druid#}</option>
<option value="3">{#Hunter#}</option>
<option value="8">{#Mage#}</option>
<option value="2">{#Paladin#}</option>
<option value="5">{#Priest#}</option>
<option value="4">{#Rogue#}</option>
<option value="7">{#Shaman#}</option>
<option value="9">{#Warlock#}</option>
<option value="1">{#Warrior#}</option>
</select></td></tr><tr>
</table>



</div>



<div class="clear"></div><div class="padded">{#Item_group_by#}:
    <input type="radio" name="gb" value="" id="gb-none" checked="checked" /><label for="gb-none">{#No_groupping#}</label>
    <input type="radio" name="gb" value="1" id="gb-slot" /><label for="gb-slot">{#Slot#}</label>
    <input type="radio" name="gb" value="2" id="gb-level" /><label for="gb-level">{#Level#}</label>
    <input type="radio" name="gb" value="3" id="gb-source" /><label for="gb-source">{#Source#}</label>
</div><div class="clear"></div>
<div class="cata"><input type="checkbox" name="ec" value="1" >{#Exclude_cataclysm#}</div><div class="padded"></div>
<div class="mop"><input type="checkbox" name="em" value="1" >{#Exclude_pandaria#}</div><div class="padded"></div><br>
<input type="submit" value="{#Apply_filter#}" />

<input type="hidden" name="upg" />

<div class="pad"></div>

</form>
</div>