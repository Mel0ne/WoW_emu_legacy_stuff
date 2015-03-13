<?php include('../configs/tplconfig.php'); ?>
<!DOCTYPE html>
<html>
<head>

<title>Freehead</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<base target="_blank" />

<link rel="stylesheet" type="text/css" href="searchbox.css" />

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="searchbox.js"></script>

</head>

<body>
<div class="expanded">
<a href="<?php echo $searchbox_website_link; ?>"><img src="<?php echo $searchbox_website_link; ?>/templates/wowhead/images/logo.png" width="50%"></a>

<form action="<?php echo $searchbox_website_link; ?>/?search=" class="search">
<span><a href="#"></a><input type="text" name="search" /></span>
</form>
</div>
</body>

</html>
