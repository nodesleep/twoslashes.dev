import rss from "@astrojs/rss";
import { getCollection } from "astro:content";

export async function GET(context) {
  const works = await getCollection("works");
  return rss({
    title: "twoslashes",
    description: "A collection of articles, essays, opinions, & more",
    site: context.site,
    items: works.map((work) => ({
      title: work.data.title,
      pubDate: work.data.pubDate,
      description: work.data.description,
      link: `/works/${work.slug}/`,
      customData: `<category>${work.data.category}</category>`,
    })),
    customData: `<language>en-us</language>`,
    stylesheet: "/rss/styles.xsl",
  });
}
