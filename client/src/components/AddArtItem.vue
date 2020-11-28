<template>
	<section class="add-art-item-container">
		<input type="number" v-model="price" placeholder="Price" />
		<label v-if="!artItem" class="add-art-item-label">
			<input type="file" accept="image/*" @change="onArtSelection" />
			Add Art
		</label>

		<button v-else @click="addArtItem()">
			Publish
		</button>
	</section>
</template>

<script>
import { ref } from "vue";
import { parseEther } from "ethers/lib/utils";

import { UseIPFSClient } from "@/plugins/ipfsHttpClient";
import { UseEthers } from "@/plugins/ethers";

export default {
	setup() {
		const ethers = UseEthers();
		const ipfs = UseIPFSClient();

		const price = ref(null);
		const artItem = ref(null);

		const onArtSelection = () => {
			artItem.value = event.target.files[0];
		};

		const addArtItem = async () => {
			const { path } = await ipfs.add(artItem.value);
			if (!path) throw new Error("Failed to add art item to IPFS");

			const tokenURI = `https://ipfs.io/ipfs/${path}`;
			const parsedPrice = parseEther(price.value.toString());
			await ethers.addArtItem(parsedPrice, tokenURI);

			// clear input
			price.value = null;
			artItem.value = null;
		};

		return {
			price,
			artItem,
			onArtSelection,
			addArtItem
		};
	}
};
</script>

<style scoped>
.add-art-item-container {
	padding: 40px;
}

.add-art-item-container input {
	padding: 10px;
}

.add-art-item-label {
	background-color: #ee4540;
	padding: 8px 12px;
	cursor: pointer;
	font-size: 1em;
	font-weight: bold;
	vertical-align: middle;
}

input[type="file"] {
	display: none;
}
</style>
