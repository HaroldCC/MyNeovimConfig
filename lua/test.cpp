#include <iostream>
#include <memory>

int main() {
  std::cout << "hello" << std::endl;
  std::shared_ptr<int> ptr = std::make_shared<int>();
  return 0;
}
