class Algo < Formula
  desc "백준 알고리즘 문제 자동 복습 스케줄링 CLI"
  homepage "https://github.com/akrap147/algo-review-cli"
  url "https://github.com/akrap147/algo-review-cli/releases/download/v0.1.8/app.jar"
  sha256 "9104d866b4f9921142123eb2eaee40e1843628039bed7787b24bdc1b46ff179d"
  license "MIT"

  depends_on "openjdk@17"

  def install
    libexec.install "app.jar"
    (bin/"algo").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk@17"].opt_bin}/java" -jar "#{libexec}/app.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/algo", "--version"
  end
end
