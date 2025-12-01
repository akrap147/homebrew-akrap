class Algo < Formula
  desc "백준 알고리즘 문제 자동 복습 스케줄링 CLI"
  homepage "https://github.com/akrap147/algo-review-cli"
  url "https://github.com/akrap147/algo-review-cli/releases/download/v0.1.10/app.jar"
  sha256 "1fe12a983a51bf106991f61b6302b6ca496285e3964dcf7f97cc9daab8649555"
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
