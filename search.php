<?php 
session_start();
require_once("connect.php");

// 1. Get input data from login form
$name = $_POST["uname"] ?? "";
$pwd = $_POST["pwd"] ?? "";

// 2. Search user in DB (Safe way)
$sql = "SELECT * FROM login WHERE loginname = ? AND pwd = ?";
$response = safeQuery($sql, "ss", [$name, $pwd]);

// 3. If SQL crash, show error and stop
if (!$response->success) {
    echo "failed to select: " . $response->error;
    die;
}

// 4. If found a match, save username to Session
if ($response->result && $data = $response->result->fetch_assoc()) {
    $_SESSION["login"] = $data['loginname'];
}

// 5. Final check: if Session has name -> Login Success!
if (!empty($_SESSION["login"])) {
    header("Location: index.php"); // go home
    exit;
} else {
    // No match found -> Go back to login page
    header("Location: login.php?msg=login_failed");
    exit;
}
?>
