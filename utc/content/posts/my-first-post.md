---
title: "My First Post"
date: 2023-08-09T15:32:29+02:00
featured_image: '/images/gohugo-default-sample-hero-image.jpg'
draft: false
---

## Introduction

This is **bold** text, and this is *emphasized* text.

```rust
#[tokio::main]
async fn main() {
  println!("hello world");
}
```

```nix
let
  mkdocsInputs = with pkgs; [
    mkdocs
    python3Packages.mkdocs-material
    hugo
  ];
in
  mkdocsInputs
```

Visit the [Hugo](https://gohugo.io) website!
