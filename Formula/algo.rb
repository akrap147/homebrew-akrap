class Algo < Formula
  desc "백준 알고리즘 문제 자동 복습 스케줄링 CLI"
  homepage "https://github.com/akrap147/algo-review-cli"
  url "https://github.com/akrap147/algo-review-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c6d9d5775cf53775d65d647bf6d084fb8e95c4c0affb157e93c5c1c0b658d851"
  license "MIT"

  depends_on "openjdk@17"

  def install
    system "./gradlew", "clean", "build"

    # build 결과 jar 저장
    libexec.install "app/build/libs/app.jar"

    # 실행 스크립트 생성
    (bin/"algo").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk@17"].opt_bin}/java" -jar "#{libexec}/app.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/algo", "--version"
  end
end