#!/bin/bash

# 指定源文件夹路径
source_folder="/nasStore/004-SV-DataSets/DatasetArchive/004-commonvoice"

# 指定目标文件夹路径
target_folder="/nasStore/004-SV-DataSets/DatasetExtract/004-commonvoice"

# 进入源文件夹
cd "$source_folder" || exit

# 遍历所有.tar.gz文件
tar_files=( *.tar.gz )
total_files="${#tar_files[@]}"
counter=0

# 遍历所有.tar.gz文件并解压到目标文件夹
for file in "${tar_files[@]}"; do
    ((counter++))

    # 提取文件名部分（不包括扩展名）
    base_name="${file%.*}"

    # 提取当前解压的包名
    echo "正在解压文件: $file"

    # 解压文件到目标文件夹
    tar -xzf "$file" -C "$target_folder"

    # 显示解压进度
    echo "解压进度: $counter/$total_files"
done

echo "解压完成。"