<template>
	<div v-if="tokenURIs.length > 0" class="container">
		<h2 class="title">My Art Purchases</h2>

		<div class="flex art-item-list">
			<ul v-for="uri in tokenURIs" :key="uri">
				<li><img class="art-item" :src="uri" alt="Art" /></li>
			</ul>
		</div>
	</div>
</template>

<script>
import { inject, ref } from "vue";

import { UseEthers } from "@/plugins/ethers";
import { ACCOUNT_INJECTION_KEY } from "@/view/constants";

export default {
	async setup() {
		const account = inject(ACCOUNT_INJECTION_KEY);
		const ethers = UseEthers();

		const tokenURIs = ref([]);

		const getTokens = async () => {
			const tokenBalance = Number(await ethers.balanceOf(account.value));
			const tokenIds = await ethers._tokenIds();

			for (let i = 1; i <= tokenIds; i++) {
				const tokenOwner = await ethers.ownerOf(i);
				if (tokenOwner.toLowerCase() === account.value) {
					const tokenURI = await ethers.tokenURI(i);
					tokenURIs.value.push(tokenURI);
				}

				if (tokenURIs.value.length === tokenBalance) break;
			}
		};

		await getTokens();

		return {
			tokenURIs
		};
	}
};
</script>

<style scoped>
.container {
	margin: 100px 0;
	width: 100%;
}
</style>
