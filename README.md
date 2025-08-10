# 📓五年日记生成器 Five-Year Journal Generator

本项目用于自动生成**五年日记**的模板文件。 This project is used to automatically generate template files for a **Five-Year Journal**.

你可以使用 .sh 脚本或 .ps1 脚本来批量创建日记文件夹和 Markdown 文件。 You can use the .sh script or .ps1 script to batch create journal folders and markdown files.

每一天都会有一个独立的 Markdown 文件，方便在 Obsidian 等笔记软件中管理。 Each day will have a separate markdown file, making it easy to manage in note-taking software like Obsidian.

## 🤖 如何使用 Usage

`git clone git@github.com:JyiDeng/Five-Year-Journal-Markdown-Generator.git`

1. 修改脚本中**的目标路径**、**年份范围**、你需要的**标签和标题**。 1. Modify the **target path**, **year range** and **tags and titles you need** in the script.
2. 运行对应的 Shell 或 PowerShell 脚本。 2. Run the corresponding shell or PowerShell script.
3. 使用你喜欢的 Markdown 阅读器，在目标文件夹中查看生成的日记模板。 3. Check the generated journal templates in the target folder, using your favorite Markdown Reader.

## 📂 文件结构示例 Example File Structure

```
五年日记文件夹/ Five-year-journal-folder/
  ├─ 01/
  │   ├─ 01-01/
  │   │   ├─ 2025-01-01.md
  │   │   ├─ 2026-01-01.md
  │   │   └─ ...
  │   └─ ...
  └─ 12/
```

每个Markdown文件包含YAML头和标题，便于分类和检索。 Each markdown file contains a YAML header and title for easy categorization and retrieval.


## 许可证 License

本项目采用 GPL-3.0 许可证。 This project is licensed under the GPL-3.0 license.
