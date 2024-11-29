<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template name="header">
    <style>
      @import url("https://fonts.cdnfonts.com/css/jetbrains-mono-2");

      :root {
        --font-family: "JetBrains Mono", monospace;
        --line-height: 1.2rem;
        --border-thickness: 2px;
        --text-color: #000;
        --text-color-alt: #666;
        --background-color: #fff;
        --background-color-alt: #eee;

        --font-weight-normal: 500;
        --font-weight-medium: 600;
        --font-weight-bold: 800;

        font-family: var(--font-family);
        font-optical-sizing: auto;
        font-weight: var(--font-weight-normal);
        font-style: normal;
        font-variant-numeric: tabular-nums lining-nums;
        font-size: 16px;
      }

      @media (prefers-color-scheme: dark) {
        :root {
          --text-color: #fff;
          --text-color-alt: #aaa;
          --background-color: #000;
          --background-color-alt: #111;
        }
      }

      * {
        box-sizing: border-box;
      }

      * + * {
        margin-top: var(--line-height);
      }

      html {
        display: flex;
        width: 100%;
        margin: 0;
        padding: 0;
        flex-direction: column;
        align-items: center;
        color: var(--text-color);
        background: var(--background-color);
        /* Dot Journal Effect */
        /* background-color: var(--background-color);
        background-image: radial-gradient(
          circle,
          var(--text-color) 1px,
          transparent 1px
        );
        background-size: 20px 20px;
        background-repeat: repeat; */
      }

      body {
        position: relative;
        width: 100%;
        margin: 0;
        padding: var(--line-height) 2ch;
        max-width: calc(min(80ch, round(down, 100%, 1ch)));
        line-height: var(--line-height);
        overflow-x: hidden;
      }

      @media screen and (max-width: 480px) {
        :root {
          font-size: 14px;
        }
        body {
          padding: var(--line-height) 1ch;
        }
      }

      h1,
      h2,
      h3,
      h4,
      h5,
      h6 {
        font-weight: var(--font-weight-bold);
        margin: calc(var(--line-height) * 2) 0 var(--line-height);
        line-height: var(--line-height);
      }

      h1 {
        font-size: 1.5rem;
        line-height: calc(1.5 * var(--line-height));
        margin-bottom: calc(var(--line-height) * 2);
        text-transform: uppercase;
      }
      h2 {
        font-size: 1rem;
        text-transform: uppercase;
      }

      hr {
        position: relative;
        display: block;
        height: var(--line-height);
        margin: calc(var(--line-height) * 1.5) 0;
        border: none;
        color: var(--text-color);
      }
      hr:after {
        display: block;
        content: "";
        position: absolute;
        top: calc(var(--line-height) / 2 - var(--border-thickness));
        left: 0;
        width: 100%;
        border-top: calc(var(--border-thickness) * 3) double var(--text-color);
        height: 0;
      }

      a {
        text-decoration-thickness: var(--border-thickness);
      }

      a:link,
      a:visited {
        color: var(--text-color);
      }

      p {
        margin-bottom: var(--line-height);
      }

      strong {
        font-weight: var(--font-weight-bold);
      }
      em {
        font-style: italic;
      }

      sub {
        position: relative;
        display: inline-block;
        margin: 0;
        vertical-align: sub;
        line-height: 0;
        width: calc(1ch / 0.75);
        font-size: 0.75rem;
      }

      table {
        position: relative;
        top: calc(var(--line-height) / 2);
        width: calc(round(down, 100%, 1ch));
        border-collapse: collapse;
        margin: 0 0 calc(var(--line-height) * 2);
      }

      th,
      td {
        border: var(--border-thickness) solid var(--text-color);
        padding: calc((var(--line-height) / 2))
          calc(1ch - var(--border-thickness) / 2)
          calc((var(--line-height) / 2) - (var(--border-thickness)));
        line-height: var(--line-height);
        vertical-align: top;
        text-align: left;
      }
      table tbody tr:first-child > * {
        padding-top: calc((var(--line-height) / 2) - var(--border-thickness));
      }

      th {
        font-weight: 700;
      }
      .width-min {
        width: 0%;
      }
      .width-auto {
        width: 100%;
      }

      .header {
        margin-bottom: calc(var(--line-height) * 2);
      }
      .header h1 {
        margin: 0;
      }
      .header tr td:last-child {
        text-align: right;
      }

      p {
        word-break: break-word;
        word-wrap: break-word;
        hyphens: auto;
      }

      pre {
        white-space: pre;
        overflow-x: auto;
        margin: var(--line-height) 0;
        overflow-y: hidden;
      }
      figure pre {
        margin: 0;
      }

      pre,
      code {
        font-family: var(--font-family);
      }

      code {
        font-weight: var(--font-weight-medium);
      }
    </style>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="rss/channel/title" />
        </title>
        <xsl:call-template name="header" />
      </head>
      <body>
        <header>
          <h1>
            <xsl:value-of select="rss/channel/title" />
          </h1>
          <h2>
            <xsl:value-of select="rss/channel/description" />
          </h2>
        </header>
        <main>
          <xsl:for-each select="rss/channel/item">
            <table class="header">
            <tr>
              <td colspan="2" rowspan="2" class="width-auto">
                <h1 class="title"><xsl:value-of select="title" /></h1>
                <span class="subtitle"><xsl:value-of select="description" /></span>
              </td>
              <th>Date</th>
              <td class="width-min"
                ><time style="white-space: pre;">
                  <xsl:variable name="pubDate" select="pubDate" />
                  <xsl:value-of select="substring($pubDate, 9, 3)" /> <!-- Day -->
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="substring($pubDate, 5, 3)" /> <!-- Month -->
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="substring($pubDate, 13, 4)" /> <!-- Year -->
                </time></td
              >
              </tr>
              <tr>
                <th>Category</th>
                <td class="width-min">
                  <xsl:value-of select="category" />
                </td>
              </tr>
            </table>
          </xsl:for-each>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
