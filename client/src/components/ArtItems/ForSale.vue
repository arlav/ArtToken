<template>
	<div class="container">
		<h2 class="title">For Sale</h2>

		<div class="flex art-item-list">
			<ul v-for="item in artItems" :key="item">
				<li><img class="art-item" :src="item.tokenURI" alt="Art" /></li>
				<li class="price">
					Price: {{ item.price }} ETH
					<button class="purchase-btn" @click="purchase(item.id, item.price)">
						Purchase
					</button>
				</li>
			</ul>
		</div>
	</div>
</template>

<script>
import { ref } from "vue";
import { formatEther, parseEther } from "ethers/lib/utils";

import { UseEthers } from "@/plugins/ethers";

export default {
	async setup() {
		const ethers = UseEthers();
		const artItemIds = Number(await ethers._artItemIds());

		const artItems = ref([]);

		for (let i = 1; i <= artItemIds; i++) {
			const [id, priceInWei, tokenURI] = await ethers.getArtItem(i);
			const price = formatEther(priceInWei);

			artItems.value.push({
				id,
				price,
				tokenURI
			});
		}

		const purchase = async (id, price) => {
			await ethers.purchaseArtItem(id, {
				value: parseEther(price.toString())
			});
		};

		return {
			artItems,
			purchase
		};
	}
};
</script>

<style scoped>
.container {
	width: 100%;
}

.price {
	border-bottom-left-radius: 6px;
	border-bottom-right-radius: 6px;
	text-align: center;
	background-color: rgb(32, 32, 32);
	margin-top: -5px;
	font-weight: bold;
	font-size: 1em;
	padding: 10px;
}

.purchase-btn {
	margin-left: 10px;
	background-color: rgb(22, 128, 57);
}
</style>
