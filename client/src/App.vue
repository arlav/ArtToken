<template>
	<main>
		<Home />
	</main>
</template>

<script>
import Home from "./view/Home";

export default {
	components: {
		Home
	}
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans&family=Fredoka+One&display=swap");

html {
	background-color: #0f0f0f;
	color: white;
	font-family: "Open Sans", sans-serif;
}

.flex {
	display: flex;
}

button {
	padding: 10px;
	color: white;
	outline: none;
	border: none;
	font-size: 1em;
	font-weight: bold;
	background-color: #ee4540;
}

button:hover {
	cursor: pointer;
}
</style>
