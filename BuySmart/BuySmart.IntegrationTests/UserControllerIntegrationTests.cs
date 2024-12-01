using Xunit;

namespace BuySmart.IntegrationTests
{
    public class UserControllerIntegrationTests
    {
        [Fact]
        public void Test1()
        {
            // Arrange
            var expectedValue = 1;
            var actualValue = 1;

            // Act
            // (Perform the action that you want to test)

            // Assert
            Assert.Equal(expectedValue, actualValue);
        }
    }
}
