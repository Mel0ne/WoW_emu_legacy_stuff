<?php
/*
    CoreManager, PHP Front End for ArcEmu, MaNGOS, and TrinityCore
    Copyright (C) 2010-2012  CoreManager Project
    Copyright (C) 2009-2010  ArcManager Project

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


//#############################################################################
//get name from realmlist.name

function get_realm_name($realm_id)
{
  global $corem_db, $sql;

  $result = $sql["mgr"]->query("SELECT name FROM `config_servers` WHERE `Index`='".$realm_id."'");
  $realm_name = $sql["mgr"]->result($result, 0);

  return $realm_name;
}


//#############################################################################
//get WOW Expansion by id

function id_get_exp_lvl()
{
  global $core;
  
  if ( $core == 1 )
  {
    $exp_lvl_arr = array
    (
       0 => array( 0, "Classic",                "Classic"    ),
       8 => array( 8, "The Burning Crusade",    "TBC"        ),
      16 => array(16, "Wrath of the Lich King", "WotLK"      ),
      24 => array(24, "Wrath of the Lich King", "WotLK + TBC")
    );
  }
  else
  {
    $exp_lvl_arr = array
    (
       0 => array( 0, "Classic",                "Classic"    ),
       1 => array( 1, "The Burning Crusade",    "TBC"        ),
       2 => array( 2, "Wrath of the Lich King", "WotLK + TBC")
    );
  }
  return $exp_lvl_arr;
}


//#############################################################################
//get GM level by ID

function id_get_gm_level($id)
{
  // we're not concerned with Web Admin
  if ( $id >= 1073741824 )
    $id -= 1073741824;

  return gmlevel_name($id);
}


//#############################################################################
// get difference between dates in days

function count_days($a, $b)
{
  $gd_a = getdate($a);
  $gd_b = getdate($b);
  $a_new = mktime(12, 0, 0, $gd_a["mon"], $gd_a["mday"], $gd_a["year"]);
  $b_new = mktime(12, 0, 0, $gd_b["mon"], $gd_b["mday"], $gd_b["year"]);
  return round( abs($a_new - $b_new) / 86400);
}


//#############################################################################
//set color per Level range

function get_days_with_color($how_long)
{
  $days = count_days($how_long, time());

  if ( $days < 1 )
    $lastlogin = '<span style="color: #009900;">'.$days.'</span>';
  elseif ( $days < 8 )
    $lastlogin = '<span style="color: #0000CC;">'.$days.'</span>';
  elseif ( $days < 15 )
    $lastlogin = '<span style="color: #FFFF00;">'.$days.'</span>';
  elseif ( $days < 22 )
    $lastlogin = '<span style="color: #FF8000;">'.$days.'</span>';
  elseif ( $days < 29 )
    $lastlogin = '<span style="color: #FF0000;">'.$days.'</span>';
  elseif ( $days < 61 )
    $lastlogin = '<span style="color: #FF00FF;">'.$days.'</span>';
  else
    $lastlogin = '<span style="color: #800000;">'.$days.'</span>';

  return $lastlogin;
}


//#############################################################################
//get DBC Language from config

function get_lang_id()
{
  # DBC Language Settings
  #  0 = English
  #  1 = Korean
  #  2 = French
  #  3 = German
  #  4 = Chinese
  #  5 = Taiwanese
  #  6 = Spanish
  #  7 = Spanish Mexico
  #  8 = Russian
  #  9 = Persian
  # 10 = Unknown
  # 11 = Unknown
  # 12 = Unknown
  # 13 = Unknown
  # 14 = Unknown
  # 15 = Unknown

  global $language;
  if ( isset($_COOKIE["lang"]) )
    $language=$_COOKIE["lang"];

// 0 = English/Default; 1 = Korean; 2 = French; 4 = German; 8 = Chinese; 16 = Taiwanese; 32 = Spanish; 64 = Russian; 128 = Persian;
  switch ( $language )
  {
    case "korean":
      return 1;
      break;
    case "french":
      return 2;
      break;
    case "german":
      return 3;
      break;
    case "chinese":
      return 4;
      break;
    case "taiwanese":
      return 5;
      break;
    case "spanish":
      return 6;
      break;
    case "mexican":
      return 7;
      break;
    case "russian":
      return 8;
      break;
    case "Persian":  // this_is_junk:  WoW doesn't come in 'Persian' lol
      return 9;
      break;
    default:
      return 0;
      break;
  }
}


?>
