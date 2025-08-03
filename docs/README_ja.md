# fzf-zen

[English](../README.md) | **日本語**

画面の中央に配置されたポップアップでファイル検索を快適に。
自然な視線位置でターミナル操作を行うことを目指すFish shellプラグイン。

## Philosophy

**「ターミナル操作における身体的・認知的ストレスの最小化」**

ターミナルでファイルを探す作業は開発者の日常で最も頻度が高い操作の一つです。しかし、対象のファイルをファイル名だけで判断しなければならず、画面の端にある小さな文字を見続けることで首や目に負担がかかり続けています。

fzf-zenは、すべてを画面の中央に配置し、大きなプレビューで内容を即座に確認できるようにすることで、この「探す時間」を快適かつ大幅に短縮します。

### 3つの設計原則
- **設定不要**: インストール後すぐに最適な状態で動作
- **中央配置**: 自然な視線位置で確認できること
- **プレビューファースト**: 選択前に内容を確認し、シンタックスハイライトで素早く把握

## Quick Start

```fish
fisher install kbryy/fzf-zen
```

## Requirements

**必須**: `fzf` `ripgrep` `bat` `tree`
**オプション**: `ghq`（Ctrl+G用）

```bash
# macOS
brew install fzf ripgrep bat tree ghq

# Ubuntu/Debian
apt install fzf ripgrep bat tree
```

## Key Bindings

| キー     | 機能             | 動作                    |
| -------- | ---------------- | ----------------------- |
| `Ctrl+O` | ファイル検索     | ripgrep + batプレビュー |
| `Ctrl+R` | 履歴検索         | コマンド履歴から検索    |
| `Ctrl+T` | ディレクトリ移動 | treeプレビュー付き      |
| `Ctrl+G` | GHQリポジトリ    | リポジトリに素早く移動  |


## Customization

```fish
set -g FZF_ZEN_POPUP_SIZE "90%,80%"        # ポップアップサイズ (デフォルト: "70%,75%")
set -g FZF_ZEN_PREVIEW_WINDOW "right:50%"  # プレビュー位置 (デフォルト: "right:60%")
```

## License

MIT License
