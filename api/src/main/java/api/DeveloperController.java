package api;

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DeveloperController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    /*
     * @RequestMapping(method=GET) public Developer developer(@RequestParam() String
     * name) { return new Greeting(counter.incrementAndGet(),
     * String.format(template, name)); }
     * 
     * @RequestMapping(method=GET) public Developer developer(@RequestParam(id =
     * "id") String name) { return new Greeting(counter.incrementAndGet(),
     * String.format(template, name)); }
     */
}
