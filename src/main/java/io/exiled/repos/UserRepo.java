package io.exiled.repos;

import io.exiled.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String name);

    User findByActivationCode(String code);
}
