import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: 'https://lpoo.eduardo-uam.com/',
	integrations: [
		starlight({
			title: 'LPOO',
			tableOfContents: { minHeadingLevel: 2, maxHeadingLevel: 5 },
			sidebar: [
				{
					label: 'Notas',
					autogenerate: { directory: 'notas' },
				},
				{
					label: 'Tareas',
					autogenerate: { directory: 'tareas' },
				},
			],
		}),
	],
});
