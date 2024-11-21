import { z, defineCollection } from "astro:content";

const worksCollection = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    pubDate: z.date(),
    description: z.string().optional(),
    author: z.string().optional(),
    category: z.string(),
    image: z
      .object({
        url: z.string(),
        alt: z.string(),
      })
      .optional(),
    tags: z.array(z.string()).optional(),
    draft: z.boolean().optional(),
  }),
});

export const collections = {
  works: worksCollection,
};
