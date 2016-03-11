package ${packageName}.di.modules;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import ${packageName}.${applicationClass};

@Module
@Singleton
public class ApplicationModule {
    ${applicationClass} app;

    public ApplicationModule(${applicationClass} app) {
        this.app = app;
    }

    @Provides
    @Singleton
    ${applicationClass} providesApplication() {
        return app;
    }
}